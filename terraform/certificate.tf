resource "digitalocean_certificate" "cert" {
  name    = "le-terraform"
  type    = "lets_encrypt"
  domains = [digitalocean_domain.domain.name]

  depends_on = [digitalocean_domain.domain]
}
