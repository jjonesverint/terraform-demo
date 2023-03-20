# Pins Terraform, AWS, and AWSCC to various version requirements. 

terraform {
  required_version = "= 1.1.7"
  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.26"
    }
  }
}