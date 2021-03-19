resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_service" "ecs_service" {
  name            = "wordpress"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.wordpress.family
  desired_count   = 1
}

resource "aws_ecs_task_definition" "wordpress" {
  family                = "wordpress"
  container_definitions = data.template_file.wordpress_template.rendered
  volume {
    name      = "volume"
  }
}

data "template_file" "wordpress_template" {
  template = file("task_definition_template.json")
  vars = {
    #db variables
    db_host = aws_db_instance.rds.endpoint
    db_user = var.db_username
    db_pwd = var.db_pwd
    db_name = var.db_name
    # ecr variables
    repository_url = var.ecr_url
    image_tag = var.image_tag
  }
}