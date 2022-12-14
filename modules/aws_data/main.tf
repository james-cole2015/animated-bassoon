resource "random_integer" "rando-id" {
  min = 10000
  max = 999999
}

/*
data "aws_iam_user" "s3_user" {
  user_name = var.user-name
}
*/

resource "random_pet" "test" {
  length = 2
}

data "aws_caller_identity" "current" {}

data "aws_iam_users" "users" {}

/*data "aws_eks_cluster" "cluster" {
  name = "${var.repo-name}-cluster"
}

data "aws_eks_cluster_auth" "cluster" {
  name = "${var.repo-name}-cluster"
}*/

data "aws_availability_zones" "available" {}