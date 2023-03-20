# Example of storing your TF state file in Terraform Cloud. Allows for easy versioning and locking.
terraform {
  backend "remote" {
    organization = "Verint-Example-Org"
    workspaces {
      name = "example_demo_state_001"
    }
  }
}
