#################################################
# LAUNCH TEMPLATE MODULE
#################################################

module "lt_module" {

  source = "../../modules/lauch_template"

  #################################################
  # ENVIRONMENT
  #################################################

  environment = var.environment

  #################################################
  # PROJECT
  #################################################

  project_name = var.project_name

  #################################################
  # EC2
  #################################################

  instance_type = var.instance_type

  key_name = var.key_name

  #################################################
  # SECURITY GROUP
  #################################################
  aws_region = var.aws_region
  ec2_security_group_id = data.terraform_remote_state.security_group.outputs.ec2_sg_id
}