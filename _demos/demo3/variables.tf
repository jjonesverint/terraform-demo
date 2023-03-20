# -----------------------------------------------------
#    Deployment Setup
# -----------------------------------------------------

#Common tags
locals {
  common_tags = tomap({
    "environment" = var.env,
    "region"      = var.region
  })
}


#Region and AZs
variable "region" { default = "us-east-2" }
variable "az1" { default = "us-east-2a" }
variable "az2" { default = "us-east-2b" }
variable "az3" { default = "us-east-2c" }

#Env tags
variable "env" { default = "dev" }

variable "vpc-flow-logs" { default = "arn:aws:s3:::verint-training-example-flowlogs" }

# -----------------------------------------------------
#    VPC and cidr block setups
# -----------------------------------------------------

#CIDR for VPC
variable "vpc_cidr" { default = "10.200.0.0/21" }
#Public Subnet 1
variable "vpc_cidr-public1" { default = "10.200.0.0/26" }
#Public Subnet 2
variable "vpc_cidr-public2" { default = "10.200.1.0/26" }
#Public Subnet 3
variable "vpc_cidr-public3" { default = "10.200.2.0/26" }
#Private Subnet 1
variable "vpc_cidr-private1" { default = "10.200.0.128/26" }
#Private Subnet 2
variable "vpc_cidr-private2" { default = "10.200.1.128/26" }
#Private Subnet 3
variable "vpc_cidr-private3" { default = "10.200.2.128/26" }
#Mgmt Subnet 1
variable "vpc_cidr-mgmt1" { default = "10.200.0.192/26" }
#Mgmt Subnet 2
variable "vpc_cidr-mgmt2" { default = "10.200.1.192/26" }
#Mgmt Subnet 3
variable "vpc_cidr-mgmt3" { default = "10.200.2.192/26" }
