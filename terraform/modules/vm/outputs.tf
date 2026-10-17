output "vm_id" {
  description = "Proxmox VM ID"
  value       = proxmox_virtual_environment_vm.this.vm_id
}

output "name" {
  description = "VM name"
  value       = proxmox_virtual_environment_vm.this.name
}

output "ipv4_address" {
  description = "Configured IPv4 address"
  value       = var.ip_address
}

output "node_name" {
  description = "Proxmox node hosting the VM"
  value       = var.node_name
}