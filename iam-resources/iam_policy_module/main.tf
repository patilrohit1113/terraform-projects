resource "aws_iam_policy" "ec2_readonly_policy" {
  name        = var.policy_name
  description = "Read-only access to AWS EC2 resources"

  policy = var.policy_json

  tags = {
    Name        = var.policy_name
    Environment = var.environment
  }
}