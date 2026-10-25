#################################################
# ACM MODULE
#################################################

module "acm" {

  source = "../../modules/auto-scalling-group"

environment = var.environment

project_name = var.project_name
launch_template_id = data.terraform_remote_state.launch_template.outputs.launch_template_id
 private_subnet_ids = data.terraform_remote_state.public_subnet.outputs.private_subnet_ids
 target_group_arn = data.terraform_remote_state.target_group.outputs.tg_arn
 launch_template_latest_version = data.terraform_remote_state.launch_template.outputs.launch_template_latest_version
 aws_region = var.aws_region

}


moved {
  from = module.module_asg.aws_autoscaling_group.web_asg
  to   = module.acm.aws_autoscaling_group.web_asg
}