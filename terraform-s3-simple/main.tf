terraform {
  required_version = ">= 1.0.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # this a single line comment
}


resource "aws_instance" "app_server" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  tags = {
    Name = "web01-dev"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-test-class2022"
    key    = "development/ec2-instances/terraform.tfstate"
    region = "us-east-1"
  }
}

# terraform {
#   backend "s3" {
#     bucket = "terraform-test-class2022"
#     key    = "ec2/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "terraform-test-class2022"
#     key    = "vpc/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "terraform-test-class2022"
#     key    = "eks/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
