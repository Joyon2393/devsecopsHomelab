variable "name" {
  description = "VM name"
  type        = string
}

variable "description" {
  description = "VM description"
  type        = string
  default     = null
}

variable "tags" {
  description = "Proxmox tags"
  type        = list(string)
  default     = []
}

variable "node_name" {
  description = "Proxmox node name"
  type        = string
}

variable "vm_id" {
  description = "Proxmox VM ID"
  type        = number
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "cpu_type" {
  description = "CPU type exposed to the VM"
  type        = string
  default     = "host"
}

variable "memory_mb" {
  description = "Dedicated memory in MB"
  type        = number
  default     = 4096
}

variable "datastore_id" {
  description = "Proxmox datastore used for the VM disk"
  type        = string
  default     = "local-lvm"
}

variable "disk_size_gb" {
  description = "VM disk size in GB"
  type        = number
  default     = 32
}

variable "image_file_id" {
  description = "Proxmox file ID for the cloud image"
  type        = string
}

variable "bridge" {
  description = "Proxmox network bridge"
  type        = string
  default     = "vmbr0"
}

variable "ip_address" {
  description = "IPv4 address in CIDR format, for example 192.168.3.100/24"
  type        = string
}

variable "gateway" {
  description = "IPv4 default gateway"
  type        = string
}

variable "username" {
  description = "Cloud-init username"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_keys" {
  description = "SSH public keys added through cloud-init"
  type        = list(string)
}

variable "dns_servers" {
  description = "DNS servers configured through cloud-init"
  type        = list(string)
  default     = ["192.168.3.1"]
}