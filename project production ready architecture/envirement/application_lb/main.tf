#################################################
# ALB MODULE
#################################################

module "appi_lb" {

  source = "../../modules/application_lb"

  #################################################
  # ENVIRONMENT
  #################################################

  environment = var.environment

  #################################################
  # PROJECT
  #################################################

  project_name = var.project_name

  #################################################
  # NETWORK
  #################################################

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  public_subnet_ids = data.terraform_remote_state.public_subnet.outputs.public_subnet_ids

  #################################################
  # SECURITY GROUP
  #################################################

  alb_security_group_id = data.terraform_remote_state.security_group.outputs.alb_sg_id

  #################################################
  # TARGET GROUP
  #################################################

  target_group_arn = data.terraform_remote_state.target_group.outputs.tg_arn

  #################################################
  # ACM CERTIFICATE
  #################################################

  acm_certificate_arn = data.terraform_remote_state.acm_backend.outputs.certificate_arn
  aws_region          = var.aws_region
}