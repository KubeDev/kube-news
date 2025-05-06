terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
  #"dop_v1_d332bb234c47d47307332b931d0c11955d5a452cf93a69e3015ebe9f505bdfda"
}

resource "digitalocean_kubernetes_cluster" "k8s_aula3" {
  name   = var.k8s_name
  #"k8s-aula3"
  region = var.region
  #""
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.23.9-do.0"

  node_pool {
    name       = "defauld"
    size       = "s-2vcpu-2gb"
    node_count = 2

   
  }
}
resource "digitalocean_kubernetes_node_pool" "node_Lucas" {
  cluster_id = digitalocean_kubernetes_cluster.k8s_aula3.id

  name       = "iniciativa"
  size       = "s-4vcpu-8gb"
  node_count = 2
}
variable "do_token" {}
variable "k8s_name" {}
variable "region" {}


output "kube_endpoint"{
    value = digitalocean_kubernetes_cluster.k8s_aula3.endpoint
}
resource "local_file" "kube_config" {
    content  = digitalocean_kubernetes_cluster.k8s_aula3.kube_config.0.raw_config
    filename = "kube_config.yaml"
}