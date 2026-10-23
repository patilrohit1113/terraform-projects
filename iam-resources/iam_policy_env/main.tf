module "aws_iam_policy" {
    source = "../iam_policy_module"
  policy_json = file(
    "${path.module}/ec2-read-only-policy.json"
  )
    
}