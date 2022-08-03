module "aws_data" {
  source = "./modules/aws_data"
}

module "kms-key" {
  source = "./modules/kms_key"
}