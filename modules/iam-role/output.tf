output "assume-role" {
  value = aws_iam_role.eks-role
}

output "policy" {
  value = aws_iam_role_policy.eks-policy
}

output "eks-iam-role" {
  value = aws_iam_role.eks-role
}