module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = "${var.repo-name}-cluster"
  cluster_version = "1.22"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }
  /*
  create_iam_role = false
  iam_role_arn = var.eks_iam_role
  */
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    blue = {
      min_size = 1
      max_size = 10
      desired_size = 1

      instance_types = [var.instance_type]
    }
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }
  
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::959867141488:user/MatthewDavis"
      username = "MatthewDavis"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::835867269469:user/AveryClark"
      username = "AveryClark"
      groups   = ["system:masters"]
    }
  ]


  aws_auth_accounts = [
    "959867141488",
    "835867269469"
  ]

} ##End of Module