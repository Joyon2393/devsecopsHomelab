resource "proxmox_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

module "devsecops_vm" {
  source = "../../modules/vm"

  name        = "devsecops-01"
  description = "DevSecOps homelab VM"
  tags        = ["devsecops", "homelab"]

  node_name = var.node_name
  vm_id     = 200

  cpu_cores = 4
  memory_mb = 8192

  datastore_id = "local-lvm"
  disk_size_gb = 50

  image_file_id = proxmox_download_file.ubuntu_cloud_image.id

  bridge = "vmbr0"

  ip_address = "192.168.3.60/24"
  gateway    = "192.168.3.1"

  username = "devsecops"

  ssh_public_keys = [
    trimspace(file(pathexpand(var.ssh_public_key_path)))
  ]

  dns_servers = [
    "192.168.3.1"
  ]
}

module "devsecops_vm02" {
  source = "../../modules/vm"

  name        = "devsecops-02"
  description = "DevSecOps homelab VM"
  tags        = ["devsecops", "homelab"]

  node_name = var.node_name
  vm_id     = 201

  cpu_cores = 2
  memory_mb = 8192

  datastore_id = "local-lvm"
  disk_size_gb = 50

  image_file_id = proxmox_download_file.ubuntu_cloud_image.id

  bridge = "vmbr0"

  ip_address = "192.168.3.61/24"
  gateway    = "192.168.3.1"

  username = "devsecops"

  ssh_public_keys = [
    trimspace(file(pathexpand(var.ssh_public_key_path)))
  ]

  dns_servers = [
    "192.168.3.1"
  ]
}