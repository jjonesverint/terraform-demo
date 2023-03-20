#Common tags
locals {
  common_tags = tomap({
    environment  = "${var.env}"
    region       = "${var.region}"
    product      = "Mgmt"
    businessunit = "VCS"
    costcenter   = "401-224-6306-70214-7753-299"
    cluster      = "Mgmt"
    environment  = "prod"
    customer     = "acme"
  })
}

variable "env" { }

variable "region" { default = "us-east-2" }

variable "server_count" { default = "1" }
