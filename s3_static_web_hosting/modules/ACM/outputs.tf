output "ACM_certi_id" {
  value = aws_acm_certificate.cert.id
}

output "domain_validation_name" {
  value = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
}

output "domain_validation_type" {
  value = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
}

output "domain_validation_value" {
  value = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value
}


output "certificate_arn" {
  value = aws_acm_certificate.cert.arn
}
