provider "aws" {
  region = "ap-southeast-2"
  profile = "default"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_dynamodb_table" "LH-dynamodb" {
    name = "LH-dynamodb"
    billing_mode   = "PROVISIONED"
    read_capacity  = 20
    write_capacity = 20

    hash_key="UserId"

    attribute{
      name = "UserId"
      type = "S"
    }
}

