resource "aws_iam_role" "eks-role" {
  name = "EKS-role"

  assume_role_policy = file("./modules/iam-role/eks-assume-role.json")

  tags = {
    repo-name   = var.repo-name
    function    = "role for eks"
    platform    = "terraform"
    environment = "development"
  }
 }

resource "iam_role_policy" "eks-policy" {
  role = aws_iam_role.eks-role.id

  policy = file("./modules/iam-role/eks-policy.json")


  tags = {
    repo-name   = var.repo-name
    function    = "role for eks"
    platform    = "terraform"
    environment = "development"
  }
 }