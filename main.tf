# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0e9bbd70d26d7cf4f"
  instance_type = "t2.micro"

  tags = {
    Name        = "JenkinsTerraformInstance"
    Environment = "Dev"
    ManagedBy   = "Jenkins"
  }
}

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.example.public_ip
}
