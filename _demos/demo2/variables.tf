variable "env" {}

variable "region" {}

resource "random_string" "random" {
  length  = 4
  special = false
  number  = false
  upper   = false
}