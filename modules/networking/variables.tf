variable "cidr_block" {
  type    = string
  default = "10.100.0.0/16"
}

variable "private_sn" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24"]
}

variable "public_sn" {
  type    = list(string)
  default = ["10.100.32.0/24", "10.100.42.0/24"]
}

variable "vpc_name" {
  type    = string
  default = "JasperMainNet"
}

variable "repo-name" {
  type = string
}


variable "eks-clusters-cidr_blocks" {
  type    = list(any)
  default = ["10.100.0.0/16", "172.16.0.0/12"]
}

