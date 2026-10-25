resource "aws_lb" "web_alb" {
  name               = "web-application-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    data.terraform_remote_state.security_group.outputs.alb_sg_id
  ]

  
  subnets = var.public_subnet_ids

  enable_deletion_protection = false
  drop_invalid_header_fields = true
  idle_timeout               = 60

  tags = {
    Name        = "web-application-alb"
    Environment = "prod"
    ManagedBy   = "Terraform"
    Project     = "alb-project"
  }
}

#################################################
# HTTP LISTENER - REDIRECT TO HTTPS
#################################################

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
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

#################################################
# HTTPS LISTENER
#################################################

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = data.terraform_remote_state.acm_backend.outputs.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.target_group.outputs.tg_arn
  }
}
