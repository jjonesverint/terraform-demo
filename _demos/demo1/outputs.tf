output "ec2_id" {
  description = "Instance ID"
  value       = aws_instance.example.id
}

output "random" {
  description = "Random value"
  value       = random_string.random.result
}
