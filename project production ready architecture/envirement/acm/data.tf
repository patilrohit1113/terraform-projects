data "terraform_remote_state" "dns_backend" {
  backend = "s3"

  config = {

    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/pro-ready-archi/dns-record/terraform.tfstate"
    region = "ap-south-1"

  }
}