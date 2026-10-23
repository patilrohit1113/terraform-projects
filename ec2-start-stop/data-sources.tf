# data "terraform_remote_state" "network" {
#   backend = "s3"
#   config = {
#      bucket = "terraform-s3-backend-rohit-11"
#     key = "projects/pro-ready-archi/vpc/terraform.tfstate"
#     region = "ap-south-1"
#   }
# }

data "terraform_remote_state" "subnet" {
  backend = "s3"

  config = {
    bucket = "terraform-s3-backend-rohit-11"
    key = "projects/pro-ready-archi/subnets/terraform.tfstate"
    region = "ap-south-1"
  }
}