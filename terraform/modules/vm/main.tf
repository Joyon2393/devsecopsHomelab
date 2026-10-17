resource "proxmox_virtual_environment_vm" "this" {
  name        = var.name
  description = var.description
  tags        = var.tags

  node_name = var.node_name
  vm_id     = var.vm_id
  hotplug = "network,usb"

  stop_on_destroy = true

  agent {
    enabled = false
  }

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  memory {
    dedicated = var.memory_mb
  }

  disk {
    datastore_id = var.datastore_id
    interface    = "scsi0"

    size = var.disk_size_gb

    file_id = var.image_file_id

    discard = "on"
    iothread = true
    ssd      = true
  }

  network_device {
    bridge = var.bridge
    model  = "virtio"
  }

  initialization {
    datastore_id = var.datastore_id

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    user_account {
      username = var.username
      keys     = var.ssh_public_keys
    }

    dns {
      servers = var.dns_servers
    }
  }

  operating_system {
    type = "l26"
  }
}