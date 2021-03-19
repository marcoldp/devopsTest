#ecs_cluster.tf
# to change service names
variable ecs_cluster_name {
    default="wordpress_ecs_cluster"
}
variable ecs_service_name {
    default="wordpress_ecs_service"
}

# required to create task definition
variable "ecr_url" {
    type = string
    description = "ECR url created"
}
variable "image_tag"{
    type = string
    description = "Tag of image corresponding to ECR url"
    default = "latest"
} 

#provider.tf
variable "region" {
   type = string
   default = "eu-west-3"
}

variable "profile" {
   type = string
   default = "default"
}

#rds.tf
variable db_name {
    default="wordpress"
}
variable db_username {
    default="admin"
}
variable db_pwd {
    default="rootpwd123"
}


