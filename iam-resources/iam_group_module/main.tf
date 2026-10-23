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


resource "aws_iam_group" "developers" {
  name = var.iam_group_name
}


resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.developers.name
  policy_arn = var.fctp_iam_group_ec2_ro
}

resource "aws_iam_group_membership" "devlopers_dave_user" {
  name = "tf-testing-group-membership"

  users = [
var.aws_iam_user_name
  ]

  group = aws_iam_group.developers.name
}



# resource "aws_iam_access_key" "tf_user_acces_key" {
#   user    = aws_iam_user.fctp_iam_user.name
 
# }