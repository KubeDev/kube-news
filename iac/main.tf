terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
  #"dop_v1_9757e6cbeb36db4f59cb0c6da3f8c27c66be2af95a22e9f7edff4f3f4bb5eb41"
}

resource "digitalocean_kubernetes_cluster" "cana_brava" {
   name   = var.cluster_name 
   #"canabrava-devops"
   region = var.region
   #"nyc1"
   version = "1.23.9-do.0"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}

resource "digitalocean_kubernetes_node_pool" "canabrava_premium" {
  cluster_id = digitalocean_kubernetes_cluster.cana_brava.id
  name       = "premium"
  size       = "s-4vcpu-8gb"
  node_count = 2
}

variable "do_token" {}
variable "cluster_name" {}
variable "region" {}

output "kube_endpoint" {
    value = digitalocean_kubernetes_cluster.cana_brava.endpoint
}

resource "local_file" "kube_config" {
    content = digitalocean_kubernetes_cluster.cana_brava.kube_config.0.raw_config
    filename = "kube_config.yaml"  
}