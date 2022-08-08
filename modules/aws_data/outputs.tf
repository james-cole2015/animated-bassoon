output "random_number" {
  value = random_integer.rando-id
}

output "petname" {
  value = random_pet.test
}

output "user-info" {
  value = data.aws_caller_identity.current
}

output "iam-user" {
  value = data.aws_iam_users.users
}

output "availability_zones" {
  value = data.aws_availability_zones.available
}

output "eks-cluster" {
  value = data.aws_eks_cluster
}

output "eks-cluster-auth" {
  value = data.aws_eks_cluster_auth
}