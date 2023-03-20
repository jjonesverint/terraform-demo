resource "aws_instance" "server" {
  ami                     = var.ami
  instance_type           = var.instance
  subnet_id               = var.subnet
  iam_instance_profile    = var.iam_ec2_role
  disable_api_termination = var.term_prot
  ebs_optimized           = var.ebs_opt
  private_ip              = var.ip
  key_name                = var.key_name
  source_dest_check       = var.source_dest_check
  vpc_security_group_ids  = var.security_groups
  user_data               = var.user_data

  # Ignores changes to the user_data field and to the size of the root EBS volume
  lifecycle {
    ignore_changes = [
      user_data,
      root_block_device[0].volume_size
    ]
  }

  root_block_device {
    volume_type           = var.root_ebs_type
    volume_size           = var.root_ebs_size
    delete_on_termination = true
  }
}
