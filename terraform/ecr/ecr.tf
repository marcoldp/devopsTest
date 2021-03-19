terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = var.profile
  region = var.region
}


resource "aws_ecr_repository" "ecr" {
  name = var.ecr_name
}
