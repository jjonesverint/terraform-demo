module "vpc-internal" {
  source = "../_modules/vpc"

  name = "example"
  cidr = "10.127.1.0/24"

  azs                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
  intra_subnets        = ["10.127.1.0/27", "10.127.1.32/27", "10.127.1.64/27"]
  enable_dns_hostnames = true
  enable_dns_support   = true

}
