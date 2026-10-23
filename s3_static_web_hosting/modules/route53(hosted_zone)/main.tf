resource "aws_route53_zone" "main" {
  name = var.domain_name
}


resource "aws_route53_record" "example_validation" {
  zone_id = aws_route53_zone.main.zone_id
  name    = data.terraform_remote_state.s3_remote_backend.outputs.domain_validation_name
  type    = data.terraform_remote_state.s3_remote_backend.outputs.domain_validation_type
  ttl     = 300
  records = [data.terraform_remote_state.s3_remote_backend.outputs.domain_validation_value]
}

# Validate ACM certificate
resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = data.terraform_remote_state.s3_remote_backend.outputs.ACM_certi_arn
  validation_record_fqdns = [aws_route53_record.example_validation.fqdn]
}