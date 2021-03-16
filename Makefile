.PHONY: terraform packer clean_resources
terraform:	
	cd terraform; terraform init 
	cd terraform; terraform apply -auto-approve

packer:
	cd packer; packer validate wordpress.pkr.hcl; 
	cd packer; packer build wordpress.pkr.hcl 

clean_resources:
	cd terraform; terraform destroy -auto-approve
