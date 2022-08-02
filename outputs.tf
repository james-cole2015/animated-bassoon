output "random_id_num" {
  value = module.aws_data.random_number.result
}

output "random_pet" {
  value = module.aws_data.petname.id
}

output "caller-id" {
  value = module.aws_data.user-info.arn
}