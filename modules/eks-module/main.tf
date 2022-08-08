module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name                    = var.cluster_name
  cluster_version                 = "1.17"
  subnets                         = var.subnet_ids
  cluster_create_timeout          = "1h"
  cluster_endpoint_private_access = true

  vpc_id = var.vpc_id

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = var.instance_type
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 1
      additional_security_group_ids = [var.mgmt_1_sg]
    },
  ]
  /*
  worker_additional_security_group_ids = [var.mgmt_all_sg]
  map_roles                            = var.map_roles
  map_users                            = var.map_users
  map_accounts                         = var.map_accounts
*/
}

resource "kubernetes_deployment" "demo" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "MyTestApp"
    }
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "MyTestApp"
      }
    }
    template {
      metadata {
        labels = {
          test = "MyTestApp"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "example_service" {
  metadata {
    name = "terraform-example-service"
  }
  spec {
    selector = {
      test = "MyTestApp"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}