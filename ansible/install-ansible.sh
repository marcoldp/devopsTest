#!/bin/sh -x
# Installation on a debian OS as specified in Ansible doc
apt --yes update
apt --yes install software-properties-common
apt --yes install gnupg2
add-apt-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt --yes update
apt --yes install ansible