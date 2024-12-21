variable "do_token" {
  description = "DigitalOcean PAT"
  type        = string
  sensitive   = true
}

variable "droplet_name" {
  description = "Droplets' name"
  type        = string
  default     = "web-server"
}

variable "image" {
  description = "DO image"
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "region" {
  description = "DO region"
  type        = string
  default     = "fra1"
}

variable "size" {
  description = "DO size"
  type        = string
  default     = "s-1vcpu-512mb-10gb"
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}
