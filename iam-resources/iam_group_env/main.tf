module "iam_group_devlopers"{
source = "../iam_group_module"
iam_group_name = var.iam_group_name
environment = var.environment

project_name = var.project_name
# aws_region = var.aws_region
fctp_iam_group_ec2_ro = var.fctp_iam_group_ec2_ro
aws_iam_user_name = data.terraform_remote_state.iam_user_dave.outputs.aws_iam_user_name_
}