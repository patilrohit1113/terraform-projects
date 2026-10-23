module "iam_user_dave"{
  source = "../iam_users_module"
iam_user_name = var.iam_user_name
environment = var.environment

project_name = var.project_name
aws_region = var.aws_region
fctp_iam_user_ec2_ro= var.fctp_iam_user_ec2_ro
}