output "ACM_certi_" {
  value = module.aws_acm_certificate.ACM_certi_id
}

output "ACM_certi_arn" {
  value = module.aws_acm_certificate.certificate_arn
}


output "domain_validation_name" {
  value = module.aws_acm_certificate.domain_validation_name
}

output "domain_validation_type" {
  value = module.aws_acm_certificate.domain_validation_type
}

output "domain_validation_value" {
  value = module.aws_acm_certificate.domain_validation_value
}
