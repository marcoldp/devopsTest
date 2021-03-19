.PHONY: create-ecr push-new-wordpress-image create-ecs-architecture clean_all_resources

ecr:	
	cd terraform/ecr; terraform init 
	cd terraform/ecr; terraform apply -auto-approve

new-wordpress-image:
	cd packer; packer validate wordpress.pkr.hcl; 
	cd packer; packer build wordpress.pkr.hcl 

aws-architecture:
	cd terraform/ecs-rds; terraform init 
	cd terraform/ecs-rds; terraform apply  -auto-approve

clean_all_resources:
	cd terraform/ecs-rds; terraform destroy -auto-approve
	cd terraform/ecr; terraform destroy -auto-approve
