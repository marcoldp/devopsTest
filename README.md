# Test Solution for Cycloid recruitement

## Procedure to solve the problem:
1. Read the documentation about Terraform & Packer & AWS ECS (since I never worked before with these technologies):
2. Start by testing the docker wordpress locally and test the installation of ansible on it
3. Create packerfile to make a new version of wordpress with ansible installed 
    3.1. Install ansible via bash script, run a simple ansible playbook on the container and then tag the docker image and push it to a repo (for now just tag and not pushed to a remote repo)
    3.2. TODO: push the image to a repo in amazon

## Problem Log:

**14 March** - At first, it was a challenge to understand the packer file syntax but I managed to catch up quickly with the bugs. I also lost a bit of time trying to understand if I could change the default entrypoint after the docker builder since by default it is --entrypoint=/bin/sh which is different from the original in the Dockerfile of wordpress.

