variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "proxmox_username" {
  description = "Proxmox username"
  type        = string
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "home_server_ip" {
  description = "Static IPv4 address for home-server"
  type        = string
}

variable "gateway_ip" {
  description = "Default IPv4 gateway"
  type        = string
}

variable "home_server_username" {
  description = "Username for the home-server user account"
  type        = string
}

variable "home_server_password" {
  description = "Password for the home-server user account"
  type        = string
  sensitive   = true
}

variable "home_server_ssh_public_key" {
  description = "SSH public key for the home-server user"
  type        = string
}
