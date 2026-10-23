#################################################
# LOCAL TAGS
#################################################

locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Project     = var.project_name
  }
}

resource "aws_iam_role" "tf_role_custom" {
  name = var.iam_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })


}
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.tf_role_custom.name
  policy_arn = var.role_policy_arn
}