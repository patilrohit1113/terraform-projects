output "public_subnet_ids" {
  value = [
    module.aws_pub_01_sub.public_subnet_1a_id,
    module.aws_pub_01_sub.public_subnet_1b_id,
    module.aws_pub_01_sub.public_subnet_1c_id
  ]
}

output "private_subnet_ids" {
  value = [
    module.aws_pub_01_sub.private_subnet_1a_id,
    module.aws_pub_01_sub.private_subnet_1b_id,
    module.aws_pub_01_sub.private_subnet_1c_id
  ]
}