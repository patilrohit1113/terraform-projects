data "terraform_remote_state" "s3_remote_backend" {
  backend = "s3"
  config = {
    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/s3_static_web_hosting/terraform.tfstate"
    region = "ap-south-1"
  }
}
