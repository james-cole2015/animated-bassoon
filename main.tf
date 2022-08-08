module "aws_data" {
  source = "./modules/aws_data"
}

module "kms-key" {
  source    = "./modules/kms_key"
  repo-name = var.repo-name
}

module "vpc" {
  source       = "./modules/networking"
  repo-name    = var.repo-name
  #cluster_name = var.cluster_name
}

module "eks-module" {
  source = "./modules/eks-module"
  repo-name    = var.repo-name
  #eks-key     = module.kms-key.kms.arn
  vpc_id       = module.vpc.vpc-info.vpc_id
  subnet_ids   = module.vpc.vpc-info.public_subnets
  eks_iam_role = module.iam-role.eks_iam_role.arn
}

module "iam-role" {
  source    = "./modules/iam-role"
  repo-name = var.repo-name
}