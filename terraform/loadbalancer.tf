resource "digitalocean_loadbalancer" "web" {
  name   = "loadbalancer"
  region = var.region
  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }

  redirect_http_to_https = true

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
