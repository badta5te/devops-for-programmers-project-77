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
