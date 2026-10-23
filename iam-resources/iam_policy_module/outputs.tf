output "policy_arn" {
  description = "ARN of the EC2 read-only IAM policy"
  value       = aws_iam_policy.ec2_readonly_policy.arn
}

output "policy_name" {
  description = "Name of the EC2 read-only IAM policy"
  value       = aws_iam_policy.ec2_readonly_policy.name
}