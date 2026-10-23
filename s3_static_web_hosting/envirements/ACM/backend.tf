terraform {
  backend "s3" {
    bucket = "terraform-s3-backend-rohit-11"
    key    = "projects/ACM_certi_for_s3/terraform.tfstate"
    region = "ap-south-1"
  }

}
