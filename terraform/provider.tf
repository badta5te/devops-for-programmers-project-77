terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "id_ed25519" {
  name = "id_ed25519"
}

resource "digitalocean_droplet" "droplet1" {
  name   = "${var.droplet_name}-1"
  image  = var.image
  region = var.region
  size   = var.size
  ssh_keys = [
    data.digitalocean_ssh_key.id_ed25519.id
  ]
}
resource "digitalocean_droplet" "droplet2" {
  name   = "${var.droplet_name}-2"
  image  = var.image
  region = var.region
  size   = var.size
  ssh_keys = [
    data.digitalocean_ssh_key.id_ed25519.id
  ]
}
resource "digitalocean_loadbalancer" "web" {
  name   = "loadbalancer"
  region = var.region
  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }
  healthcheck {
    protocol = "http"
    port     = 80
    path     = "/"
  }

  sticky_sessions {
    type               = "cookies"
    cookie_name        = "DO-LB"
    cookie_ttl_seconds = 600
  }

  droplet_ids = [digitalocean_droplet.droplet1.id, digitalocean_droplet.droplet2.id]
  depends_on  = [digitalocean_droplet.droplet1, digitalocean_droplet.droplet2]
}

resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.domain.name
  type   = "A"
  name   = "www"
  value  = digitalocean_loadbalancer.web.ip
}

resource "digitalocean_record" "root" {
  domain = digitalocean_domain.domain.name
  type   = "A"
  name   = "@"
  value  = digitalocean_loadbalancer.web.ip
}

resource "digitalocean_certificate" "cert" {
  name    = "le-terraform"
  type    = "lets_encrypt"
  domains = [digitalocean_domain.domain.name]

  depends_on = [digitalocean_domain.domain]
}

resource "digitalocean_database_cluster" "postgres-example" {
  name       = "example-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}
