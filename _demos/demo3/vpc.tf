#New VPC
module "vpc" {
  source            = "../../_modules/vpc"
  vpc_cidr          = var.vpc_cidr
  vpc-flow-logs     = var.vpc-flow-logs
  region            = var.region
  az1               = var.az1
  az2               = var.az2
  az3               = var.az3
  vpc_cidr-public1  = var.vpc_cidr-public1
  vpc_cidr-public2  = var.vpc_cidr-public2
  vpc_cidr-public3  = var.vpc_cidr-public3
  vpc_cidr-private1 = var.vpc_cidr-private1
  vpc_cidr-private2 = var.vpc_cidr-private2
  vpc_cidr-private3 = var.vpc_cidr-private3
  vpc_cidr-mgmt1    = var.vpc_cidr-mgmt1
  vpc_cidr-mgmt2    = var.vpc_cidr-mgmt2
  vpc_cidr-mgmt3    = var.vpc_cidr-mgmt3
  enable_nat        = "Enabled"
  env               = var.env
  tags              = local.common_tags
}

