output "random_id_num" {
  value = module.aws_data.random_number.result
}

output "random_pet" {
  value = module.aws_data.petname.id
}

/*
output "caller-id" {
  value = module.aws_data.user-info.arn
}*/

output "iam-user" {
  value = module.aws_data.iam-user.names
}

output "kms-arn" {
  value = module.kms-key.kms.arn
}

output "kms-id" {
  value = module.kms-key.kms.key_id
}

output "vpc-id" {
  value = module.vpc.vpc-info.vpc_id
}

output "iam-assume-role-arn" {
  value = module.iam-role.assume-role.arn
}

output "policy-id" {
  value = module.iam-role.policy.id
}

output "azs" {
  value = module.aws_data.availability_zones.names
}

output "cluster-endpoint" {
  value = module.eks-module.eks-info.cluster_endpoint
}

output "cluster-name" {
  value = module.eks-module.eks-info.cluster_id
}
/*
output "cluster-endpoint" {
  value = module.aws_data.eks-cluster.endpoint 
}

forumla:
value = module.main_tf_module_name.output_name_from_module_output.desired_value
*/