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


# end of script
