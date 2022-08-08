data "aws_availability_zones" "available" {}

module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  name                         = var.vpc_name
  cidr                         = var.cidr_block
  azs                          = data.aws_availability_zones.available.names
  private_subnets              = var.private_sn
  public_subnets               = var.public_sn
  create_igw                   = true
  create_database_subnet_group = true
  #enable_nat_gateway           = true
  single_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = shared
    "kubernetes.io/role/elb"                    = 1
  }

  tags = {
    repo-name   = var.repo-name
    function    = "vpc for eks"
    Name        = var.vpc_name
    platform    = "terraform"
    environment = "development"
  }
}

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.cidr_block]
  }
}
  resource "aws_security_group" "all_worker_mgmt" {
    name_prefix = "all_worker_mgmt"
    vpc_id      = module.vpc.vpc_id

    ingress {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"

      cidr_blocks = var.eks-clusters-cidr_blocks
    }
  }