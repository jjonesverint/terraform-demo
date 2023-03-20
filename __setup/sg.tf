
resource "aws_security_group" "sg_example" {
  name        = "sg_example"
  vpc_id      = module.vpc.vpc_id
  description = "Opens ingress and egress for the Example instances."

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      "Name" = "sg_example"
    },
  )
}