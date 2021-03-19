# to give a name to the ecr repo
variable "ecr_name" {
   type = string
   default = "test_wordpress"
}

# provider specifications
variable "region" {
   type = string
   default = "eu-west-3"
}
variable "profile" {
   type = string
   default = "default"
}