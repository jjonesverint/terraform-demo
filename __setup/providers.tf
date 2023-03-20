#TF version
terraform {
  backend "s3" {
    bucket = "verint-training-example-tfstate"
    key    = "__setup.tfstate"
    region = "us-east-2"
  }
}

#Provider and creds
provider "aws" {
  region = var.region
}
