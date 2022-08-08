
variable "repo-name" {
  type = string
}

/*
variable "eks-key" {
  type = string
}
*/
variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(any)
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "eks_iam_role" {
  type = string
}
/*
variable "map_accounts" {
  type = list(string)
  default = [
    "959867141488",
    "835867269469"
  ]
}

variable "map_roles" {
  type = list(object)
    rolearn = string
    username = string
    groups list(string)

  default = [
    {
      rolearn = 
    }
  ]
}

variable "map_users" {
  type = list(object) 
  userarn = 
  username = 
  groups = 

  default = [
    userarn = "arn:aws:iam::959867141488:user/MatthewDavis"
    username = "MatthewDavis"
    groups = [""]
  ]
}*/