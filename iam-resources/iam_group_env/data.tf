data "terraform_remote_state" "iam_user_dave" {

  backend = "s3"

  config = {

    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/iam/iam-users/alb/terraform.tfstate"
    region = "ap-south-1"
  }
}