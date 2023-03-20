# Example of storing TF state in S3 bucket
terraform {
  backend "s3" {
    bucket = "testing-new-s3-bucket"
    key    = "terraform"
    region = "us-east-1"
  }
}

# Multiple Providers - in this case each region. 
provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "use2"
  region = "us-east-2"
}

provider "aws" {
  alias  = "cac1"
  region = "ca-central-1"
}

# Create a VPC in us-east-1
module "vpc" {
  provider    = aws.use1
  source    = "terraform-aws-modules/vpc/aws"

  name = "example-use1"
  cidr = "10.20.30.0/24"

  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  intra_subnets        = ["10.20.30.0/27", "10.20.30.32/27", "10.20.30.64/27"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_vpn_gateway   = true

}

# Create a VPC in us-east-2
module "vpc" {
  provider    = aws.use2
  source    = "terraform-aws-modules/vpc/aws"

  name = "example-use2"
  cidr = "10.20.40.0/24"

  azs                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
  intra_subnets        = ["10.20.40.0/27", "10.20.40.32/27", "10.20.40.64/27"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_vpn_gateway   = true

}

