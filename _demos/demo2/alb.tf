# Security group for Application alb. Open 80/443 inbound but only 443 outbound
resource "aws_security_group" "sg_alb-app" {
  name        = "sg_alb-app"
  description = "sg_alb-app"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Create an ALB
resource "aws_lb" "alb_app" {
  name                       = "alb-app"
  internal                   = true
  idle_timeout               = 3600
  load_balancer_type         = "application"
  enable_deletion_protection = false
  security_groups            = [aws_security_group.sg_alb-app.id]
  subnets                    = [data.terraform_remote_state.vpc.outputs.subnet1, data.terraform_remote_state.vpc.outputs.subnet2]

  tags = {
    "Name" = "alb_app"
  }


}

/*

The rest of this is an example of what a fully deployed ALB might look like

# Create an ALB listener on 443
resource "aws_lb_listener" "albl_app" {
  load_balancer_arn = aws_lb.alb_app.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.cert
  ssl_policy        = var.elb_sec_pol

  default_action {
    target_group_arn = aws_lb_target_group.tg_app.arn
    type             = "forward"
  }
}

# Add http to https redirect to the ALB
resource "aws_lb_listener" "albl_app2" {
  load_balancer_arn = aws_lb.alb_app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Create a Target group 
resource "aws_lb_target_group" "tg_app" {
  name                 = "tg-app-${var.env}"
  port                 = 443
  protocol             = "HTTPS"
  vpc_id               = data.terraform_remote_state.vpc.outputs.vpc_id
  deregistration_delay = 3600

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 3600
    enabled         = true
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/healthCheck"
    port                = 443
    protocol            = "HTTPS"
  }

  tags = merge(
    local.common_tags,
    {
      "Name" = "tg-app-${var.env}"
    },
  )
}

# Attaches a server to the target group
resource "aws_lb_target_group_attachment" "albtga_app1" {
  target_group_arn = aws_lb_target_group.tg_app.arn
  target_id        = data.terraform_remote_state.vpc.outputs.ec2_id
}
*/