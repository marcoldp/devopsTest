# Creates new docker image of wordpress by running ansible inside
# Variables used in the packerfile
variables {
  image_tags = ["latest"]
  ecr_url = env("ECR_URL")
  ecr_registry_id = env("ECR_REGISTRY_ID")
  aws_access_key_id = env("AWS_ACCESS_KEY_ID")
  aws_secret_access_key = env("AWS_SECRET_ACCESS_KEY")
  aws_zone = "eu-west-3"

}

source "docker" "wordpress" {
  image = "wordpress:latest"
  commit = true 
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.docker.wordpress"]

  provisioner "shell" {
    script = "../ansible/install-ansible.sh"
  }

  provisioner "ansible-local" {
    playbook_file = "../ansible/playbook.yaml"
  }
  post-processors{
    post-processor "docker-tag"{
      repository=var.ecr_url
      tags=var.image_tags
    }
    post-processor "docker-push"{
      ecr_login = true
      aws_access_key = var.aws_access_key_id
      aws_secret_key = var.aws_secret_access_key
      login_server = "https://${var.ecr_registry_id}.dkr.ecr.${var.aws_zone}.amazonaws.com"
    }
  }
}


