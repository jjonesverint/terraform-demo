output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.server.id
}

output "instance_ip" {
  description = "Private Ip"
  value       = aws_instance.server.private_ip
}

output "availability_zone" {
  description = "Availability zone"
  value       = [aws_instance.server.availability_zone]
}
