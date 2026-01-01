terraform {
  backend "s3" {
    bucket = "my-terraform-state-gayathri"
    key    = "ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-EC2-${count.index + 1}"
  }
}

