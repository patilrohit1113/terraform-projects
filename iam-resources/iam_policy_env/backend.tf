terraform {
  backend "s3" {
    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/iam/iam-policy/alb/terraform.tfstate"
    region = "ap-south-1"
  }

}