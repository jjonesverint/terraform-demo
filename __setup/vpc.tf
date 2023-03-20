module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "example"
  cidr = "10.20.24.0/21"

  azs                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
  intra_subnets        = ["10.20.24.0/24", "10.20.25.0/24", "10.20.26.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_vpn_gateway   = false

}

