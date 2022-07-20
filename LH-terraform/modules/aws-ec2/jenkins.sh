#!/bin/bash

# install jenkins
sudo yum update -y

#which amazon-linux-extras
#amazon-linux-extras
#sudo amazon-linux-extras install epel -y
#sudo amazon-linux-extras install java-openjdk11

sudo yum install epel-release -y
sudo yum install java-11-openjdk-devel -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins -y

sudo systemctl enable jenkins
sudo systemctl start jenkins

# sudo service jenkins start

sudo yum install git -y

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# manual configuration: add credentail, install plugin

# end of script
