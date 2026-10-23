terraform {
  backend "s3" {
    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/cloud_front_distribution/terraform.tfstate"
    region = "ap-south-1"
  }

}