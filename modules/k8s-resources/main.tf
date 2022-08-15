provider "kubernetes" {
  host                   = module.eks-module.eks-info.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks-module.eks-info.cluster_certificate_authority_data)
}

resource "kubernetes_deployment" "demo" {
  metadata {
    name = "${var.repo-name}-example"
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
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
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
