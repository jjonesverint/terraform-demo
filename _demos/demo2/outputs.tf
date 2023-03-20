output "alb_dns" {
  description = "ALB DNS Name"
  value       = aws_lb.alb_app.dns_name
}
