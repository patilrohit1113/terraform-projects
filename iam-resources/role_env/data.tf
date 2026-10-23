data "terraform_remote_state" "iam_policy_iam" {

  backend = "s3"

  config = {

    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/iam/iam-policy/alb/terraform.tfstate"
    region = "ap-south-1"
  }
}