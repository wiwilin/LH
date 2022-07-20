terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# module "LH-module-ec2" {
#   source = "./modules/aws-ec2"
# }

# module "LH-module-s3" {
#   source = "./modules/aws-s3"
# }


 module "LH-module-db" {
   source = "./modules/aws-db"
 }



