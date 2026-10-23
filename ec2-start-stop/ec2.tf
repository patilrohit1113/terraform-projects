# SECURITY GROUP - OUTBOUND ACCESS ONLY

resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}_tf_sg"
  description = "EC2 security group with outbound access only"
  vpc_id      = "vpc-02ec0050799e2f73e"

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-security-group-tf"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# EC2 INSTANCE

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id = "subnet-0144867d5d909f911"

  # Use the security group created above
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  # Add your subnet if needed
  # subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids[0]

  user_data = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable --now nginx
    echo "<h1>Hello from Terraform</h1>" > /var/www/html/index.html
  EOT

  tags = {
    Name         = "${var.project_name}-tf-instance"
    AutoSchedule = "true"
  }
}