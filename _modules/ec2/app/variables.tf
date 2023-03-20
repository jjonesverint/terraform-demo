variable "server_name" {
  description = "Server moniker."
  default     = ""
}

variable "env" {
  description = "Environment name"
  default     = ""
}

variable "ami" {
  description = "AMI"
  default     = ""
}

variable "ip" {
  description = "Private IP"
  default     = ""
}

variable "subnet" {
  description = "Subnet"
  default     = ""
}

variable "instance" {
  description = "Instance size."
  default     = ""
}

variable "iam_ec2_role" {
  description = "Profile for instance."
  default     = "vcs_ec2-default"
}

variable "term_prot" {
  description = "Enable instance deletion protection."
  default     = true
}

variable "key_name" {
  description = "SSH key used for instance."
  default     = ""
}

variable "security_groups" {
  description = "Enable instance deletion protection."
  default     = []
}

variable "source_dest_check" {
  description = "Toggle check on/off."
  default     = "true"
}

variable "user_data" {
  description = "Instance user data."
  default     = ""
}

variable "tags" {
  description = "Receives default tags."
  default     = {}
}

#########################
# EBS- related options
#########################

variable "encrypted" {
  description = "Encrypt the EBS volumes"
  default     = true
}

variable "kms_key_id" {
  description = "Key to use for encrypting the EBS volumes"
  default     = ""
}

variable "ebs_opt" {
  description = "Should the instance be EBS optimized."
  default     = true
}

variable "root_ebs_size" {
  description = "Size of root ebs volume."
  default     = "180"
}

variable "root_ebs_type" {
  description = "Set the type of EBS volume for root device"
  default     = "gp3"
}

variable "ebs_type" {
  description = "Set the type of EBS volume"
  default     = "gp3"
}

variable "ebs_e" {
  description = "Size of E volume."
  default     = 0
}

variable "ebs_k" {
  description = "Size of K volume."
  default     = 0
}

variable "ebs_g" {
  description = "Size of G volume."
  default     = 0
}
