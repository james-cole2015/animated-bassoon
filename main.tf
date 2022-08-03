module "aws_data" {
  source = "./modules/aws_data"
}

module "kms-key" {
  source    = "./modules/kms_key"
  repo-name = var.repo-name
}

module "vpc" {
  source    = "./modules/networking"
  repo-name = var.repo-name
}