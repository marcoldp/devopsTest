# Test Solution for Cycloid recruitement

## Procedure to solve the problem:
1. Read the documentation about Terraform & Packer & AWS ECS/RDS (since I never worked before with these technologies):
2. Start by testing the docker wordpress locally and test the installation of ansible on it
3. Create packerfile to make a new version of wordpress with ansible installed 
    1. Install ansible via bash script, run a simple ansible playbook on the container and then tag the docker image and push it to a repo (for now just tag and not pushed to a remote repo)
4. Push the created image in amazon ECR using terraform to create repo
    1. Install aws cli and configure using aws configure to create file in ~/.aws/credentials use eu-west-3 region (Paris)
    2. Create the terraform file to create ECR and then relaunch packer to push the image into it
    3. Also decided to create a .gitignore to avoid pushing unnecessary terraform files and a Makefile to make easier to test 

## How to use:
    1. Create your [aws account](https://console.aws.amazon.com/iam/home?#security_credential) 
## Problem Log:

**14 March** - At first, it was a challenge to understand the packer file syntax but I managed to catch up quickly with the bugs. I also lost a bit of time trying to understand if I could change the default entrypoint after the docker builder since by default it is --entrypoint=/bin/sh which is different from the original in the Dockerfile of wordpress.

**15 March** - Some problems with how to connect to aws (via profile or credentials ).



