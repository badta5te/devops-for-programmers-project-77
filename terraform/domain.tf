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
