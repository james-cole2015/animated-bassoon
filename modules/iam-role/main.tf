resource "aws_iam_role" "eks-role" {
  name = "eks-role"

  assume_role_policy = file("./modules/iam-role/eks-assume-role.json")
}