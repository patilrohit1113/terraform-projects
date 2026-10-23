resource "aws_security_group" "alb_sg" {
  description = "allow http rule"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  name = var.alb_sg_name
}

resource "aws_vpc_security_group_ingress_rule" "http-allowed_alb" {
  security_group_id = aws_security_group.alb_sg.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allowed_outbound_alb" {
  security_group_id = aws_security_group.alb_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_security_group" "ec2_sg" {
  description = "allow http rule"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  name = var.ec2_sg_name
}

resource "aws_vpc_security_group_ingress_rule" "http-allowed_ec2" {
  security_group_id            = aws_security_group.ec2_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id

  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "allowed_outbound_ec2" {
  security_group_id = aws_security_group.ec2_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}