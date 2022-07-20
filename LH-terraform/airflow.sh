#!/bin/bash

# install docker
sudo yum update
sudo yum install docker

#install docker-compose
sudo yum install python3-pip
pip3 install --user docker-compose  #--user: without root access for security reason

sudo systemctl enable docker.service
sudo systemctl start docker.service

# install airflow
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.3/docker-compose.yaml'
docker-compose up airflow-init
docker-compose up

# end of script