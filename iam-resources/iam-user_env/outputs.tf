output "user_arn" {
  value = module.iam_user_dave.iam_user_arn
}
output "aws_iam_user_name_" {
  value = module.iam_user_dave.aws_iam_user_name
}
output "access_key_id" {
  value = module.iam_user_dave.access_key_id
}


# tf output secreat_key        # use this command for the view secreat acces key
# tf output secreat_key > secrt.txt   # to store screat acces key in the  secrt.txt file 
 # tf output secreat_key | tee sec.txt 
output "secreat_key" {
  value = module.iam_user_dave.secreat_key
  sensitive = true
}