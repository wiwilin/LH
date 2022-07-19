terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
  profile = "default"
}

resource "aws_vpc" "LH-vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    Name = "LH-vpc"
  }
}

resource "aws_security_group" "LH-sg" {
  name = "LH-sg"
  //vpc_id = aws_vpc.LH-vpc.id
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "LH-sg"
  }
}

  resource "aws_instance" "LH-ec2-vault" {
  ami  = "ami-07620139298af599e"
  instance_type = "t2.micro"
  key_name = "LH-keypair"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.LH-sg.id]
  tags = {
    Name = "LH-ec2-vault"
  }
}

  resource "aws_instance" "LH-ec2-airflow" {
  ami  = "ami-07620139298af599e"
  instance_type = "t2.micro"
  key_name = "LH-keypair"
  vpc_security_group_ids = [aws_security_group.LH-sg.id]

  user_data = file("airflow.sh")

  tags = {
    Name = "LH-ec2-airflow"
  }
}

resource "aws_instance" "LH-ec2-jenkins" {
  ami  = "ami-07620139298af599e"
  instance_type = "t2.micro"
  key_name = "LH-keypair"
  vpc_security_group_ids = [aws_security_group.LH-sg.id]
  tags = {
    Name = "LH-ec2-jenkins"
  }
    provisioner "file" {
    source      = "jenkins.sh"
    destination = "jenkins.sh"
  }
  
  connection {
      host = self.public_ip
      type     = "ssh"
      user     = "ec2-user"
      private_key = file("LH-keypair.pem")

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x jenkins.sh",
      "jenkins.sh args",
    ]
  }
}






