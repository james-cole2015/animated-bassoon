resource "aws_kms_key" "kms-key" {
  description = "KMS Key for EKS"
  key_usage   = "ENCRYPT_DECRYPT"

  tags = {
    platform    = "terraform"
    environment = "development"
    repo-name   = "${var.repo-name}"
    function    = "encryption_key"
    Name        = "EKS-Key"
  }
}