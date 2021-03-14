packer-validate:
	cd packer; packer validate wordpress.pkr.hcl

packer-build:
		cd packer; packer build wordpress.pkr.hcl
		#-var 'weekday=Sunday' 
