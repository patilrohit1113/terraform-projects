terraform {
  backend "s3" {
    bucket = "remote-s3-backend-for-terraform-tfstate-file"
    key = "workspaces/ec2/terraform.tfstate"
    region = "ap-south-1"
  }

}