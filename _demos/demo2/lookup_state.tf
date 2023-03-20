data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "verint-training-example-tfstate"
    key    = "__setup.tfstate"
    region = "us-east-2"
  }
}
