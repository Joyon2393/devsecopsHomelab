variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "node_name" {
  description = "Proxmox node name"
  type        = string
  default     = "pve"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key used by cloud-init"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}