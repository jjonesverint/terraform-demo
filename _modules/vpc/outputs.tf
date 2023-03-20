output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = aws_vpc.vpc.arn
}

output "subnet_public1" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_public1.id
}

output "subnet_public2" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_public2.id
}

output "subnet_public3" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_public3.id
}

output "subnet_private1" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_private1.id
}

output "subnet_private2" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_private2.id
}

output "subnet_private3" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_private3.id
}

output "subnet_mgmt1" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_mgmt1.id
}

output "subnet_mgmt1_arn" {
  description = "Subnet ARN"
  value       = aws_subnet.subnet_mgmt1.arn
}

output "subnet_mgmt2" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_mgmt2.id
}

output "subnet_mgmt2_arn" {
  description = "Subnet ARN"
  value       = aws_subnet.subnet_mgmt2.arn
}

output "subnet_mgmt3" {
  description = "Subnet ID"
  value       = aws_subnet.subnet_mgmt3.id
}

output "subnet_mgmt3_arn" {
  description = "Subnet ARN"
  value       = aws_subnet.subnet_mgmt3.arn
}

output "pubrt" {
  description = "Public Route Table ID"
  value       = aws_route_table.pubrt.id
}

output "prt1" {
  description = "Private Route Table 1 ID"
  value       = aws_route_table.prt1.id
}

output "prt2" {
  description = "Private Route Table 2 ID"
  value       = aws_route_table.prt2.id
}

output "prt3" {
  description = "Private Route Table 3 ID"
  value       = aws_route_table.prt3.id
}

output "nacl" {
  description = "NACL ID"
  value       = aws_network_acl.nacl.id
}
