
data "aws_route53_zone" "primary" {
  name         = var.hosted_zone_name
  private_zone = false
}

data "terraform_remote_state" "alb_backend" {
  backend = "s3"

  config = {
    bucket = "terraform-s3-backend-rohit-11"
    key    = "projects/pro-ready-archi/alb/terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_route53_record" "alb_alias" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.dns_name_to_access_alb
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.alb_backend.outputs.alb_dns_name
    zone_id                = data.terraform_remote_state.alb_backend.outputs.alb_zone_id
    evaluate_target_health = true
  }
}
