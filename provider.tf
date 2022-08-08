terraform {
  backend "s3" {
    bucket         = "amazing-waterfall-13739"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "amazing-waterfall-table"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    kubernetes = {
      version = "2.10.0"
    }
  }


}

provider "aws" {
  region                   = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  shared_config_files      = ["~/.aws/config"]
}

/*
provider "kubernetes" {
  host                   = module.aws_data.eks-cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(module.aws_data.eks-cluster.cluster.certificate_authority.0.data)
  token                  = module.aws_data.eks-cluster-auth.cluster.token
  #load_config_file       = false
}*/