#################################################
# ALB
#################################################

output "alb_dns_name" {

  value = module.appi_lb.alb_dns_name
}

output "alb_arn" {

  value = module.appi_lb.alb_arn
}


output "alb_id" {

  value = module.appi_lb.alb_id
}

output "alb_zone_id" {

  value = module.appi_lb.alb_zone_id
}
