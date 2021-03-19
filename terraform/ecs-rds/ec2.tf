# to launch Amazon ECS-optimized AMI
data "aws_ami" "ecs_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.ecs_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = aws_iam_instance_profile.ecs.name
    vpc_security_group_ids = [aws_security_group.ec2.id]
    subnet_id = aws_subnet.public.id
    associate_public_ip_address = true
    user_data = data.template_file.ecs_cluster_config_template.rendered
}

data "template_file" "ecs_cluster_config_template" {
  template = file("ecs_cluster_config_template.sh")
  vars = {
    ecs_cluster = aws_ecs_cluster.ecs_cluster.name
  }
}