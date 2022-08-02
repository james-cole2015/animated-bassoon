output "random_number" {
  value = random_integer.rando-id
}
/*
output "iam-user" {
  value = data.aws_iam_user.s3_user
}
*/
output "petname" {
  value = random_pet.test
}

output "user-info" {
  value = data.aws_caller_identity.current
}