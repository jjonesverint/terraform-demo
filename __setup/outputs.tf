output "vpc_id" {
  description = "VPC ID"
  value       = "${module.vpc.vpc_id}"
}

output "subnet1" {
  description = "Subnet ID"
  value       = module.vpc.intra_subnets[0]
}

output "subnet2" {
  description = "Subnet ID"
  value       = module.vpc.intra_subnets[1]
}

output "subnet3" {
  description = "Subnet ID"
  value       = module.vpc.intra_subnets[2]
}

output "sg_id" {
  description = "SG ID"
  value       = aws_security_group.sg_example.id
}
