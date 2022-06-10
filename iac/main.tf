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
  #"dop_v1_9a3ebfbfcaed563466b9b812f5609edb85b0958626a02a02ad3be37c04310802"
}

resource "digitalocean_kubernetes_cluster" "k8s_iniciativa_DevOps" {
  name   = var.k8s_name
  #"k8s-iniciativa-devops"
  region = var.region
  #"nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

#Node pool
resource "digitalocean_kubernetes_node_pool" "node_premium" {
  cluster_id = digitalocean_kubernetes_cluster.k8s_iniciativa_DevOps.id

  name       = "premium"
  size       = "s-4vcpu-8gb"
  node_count = 2
}

variable "do_token" {}

variable "k8s_name" {}

variable "region" {}