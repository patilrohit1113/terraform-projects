terraform {
  backend "s3" {
    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/s3_static_web_hosting/terraform.tfstate"
    region = "ap-south-1"
  }

}