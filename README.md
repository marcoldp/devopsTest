# Test Solution for Cycloid recruitement

## Procedure to solve the problem:
1. Read the documentation about Terraform & Packer & AWS ECS/RDS (since I never worked before with these technologies):
2. Start by testing the docker wordpress locally and test the installation of ansible on it
3. Create packerfile to make a new version of wordpress with ansible installed 
    1. Install ansible via bash script, run a simple ansible playbook on the container and then tag the docker image and push it to a repo (for now just tag and not pushed to a remote repo)
4. Push the created image in amazon ECR using terraform to create repo
    1. Install aws cli and configure using aws configure to create file in ~/.aws/credentials use eu-west-3 region (Paris)
    2. Create the terraform file to create ECR and then relaunch packer to push the image into it
    3. Implement a .gitignore to avoid pushing unnecessary terraform files and a Makefile to make easier to test 

## How to use:

1. Create your [aws account](https://console.aws.amazon.com/iam/home?#security_credential) and install aws-cli. Set local aws profile using:
```
    aws configure
```
2. Create the terraform resources to quickly launch terraform init and apply using make:
```
    make terraform
```
3. Export the outputs of the terraform as env variables:
```makefile
    export ECR_URL=$(cd terraform; terraform output url_ecr | tr -d '"')
    export ECR_REGISTRY_ID=$(cd terraform; terraform output registry_id_ecr | tr -d '"')
```
4. Create, tag and push new image version of wordpress_docker into created ECR:
```makefile
    make packer
```
5. Finally, to clean the resources all created resources in AWS use:
```makefile
    make clean_resources
```
## Problem Log:

**14 March** - At first, it was a challenge to understand the packer file syntax but I managed to catch up quickly with the bugs. I also lost a bit of time trying to understand if I could change the default entrypoint after the docker builder since by default it is --entrypoint=/bin/sh which is different from the original in the Dockerfile of wordpress.

**16 March** - Some problems with how to connect to aws (via profile or credentials ). Also had some problems trying to understand if i could automatise the export of the env variables 



