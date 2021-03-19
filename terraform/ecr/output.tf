output "url_ecr" {
 description = "URL of created repo"
 value = aws_ecr_repository.ecr.repository_url
}

output "registry_id_ecr" {
 description = "ID associated to the register"
 value = aws_ecr_repository.ecr.registry_id
}