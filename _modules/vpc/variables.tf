variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  default     = ""
}

variable "vpc-flow-logs" {
  description = "ARN of S3 bucket for VPC flow logs"
  default     = ""
}

variable "region" {
  description = "Region for VPC"
  default     = ""
}

variable "az1" {
  description = "First AZ"
  default     = ""
}

variable "az2" {
  description = "Second AZ"
  default     = ""
}

variable "az3" {
  description = "Third AZ"
  default     = ""
}


variable "vpc_cidr-public1" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-public2" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-public3" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-private1" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-private2" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-private3" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-mgmt1" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-mgmt2" {
  description = "Subnet ID"
  default     = ""
}

variable "vpc_cidr-mgmt3" {
  description = "Subnet ID"
  default     = ""
}

variable "enable_nat" {
  description = "Add or remove AWS NAT Gateways"
  default     = "Disabled"
}

variable "env" {
  description = "Environment name"
  default     = ""
}

variable "tags" {
  description = "Receives default tags."
  default     = {}
}
