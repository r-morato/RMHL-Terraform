terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~> 2.9"
    }
  }
}

provider "proxmox" {
  # Change these to your Proxmox connection details
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "honeypot" {
  name        = var.vm_name
  target_node = var.proxmox_node
  vmid        = var.vmid
  cores       = var.vm_cores
  memory      = var.vm_memory
  sockets     = 1
  disk {
    size    = var.vm_disk_size
    type    = "scsi"
    storage = var.proxmox_storage
    format  = "qcow2"
  }
  network {
    model  = "virtio"
    bridge = var.proxmox_bridge
  }

  # Use cloud-init to bootstrap Docker and your honeypot stack
  cicustom = [
    "user=local:snippets/cloud-init.cfg"
  ]

  ssh_forward_ip   = "0.0.0.0"
  ssh_forward_port = 2222

  onboot = true
}

resource "proxmox_cloudinit_config" "honeypot" {
  vmid = proxmox_vm_qemu.honeypot.vmid

  user = "ubuntu"
  password = var.vm_password

  ssh_authorized_keys = [file("~/.ssh/id_rsa.pub")]

  # Install Docker, Docker Compose, git and clone your honeypot repo + start it
  user_data = <<-EOF
    #cloud-config
    packages:
      - docker.io
      - docker-compose
      - git
    runcmd:
      - systemctl enable docker
      - systemctl start docker
      - git clone https://github.com/r-morato/docker-honeynet.git /home/ubuntu/honeypot
      - chown -R ubuntu:ubuntu /home/ubuntu/honeypot
      - cd /home/ubuntu/honeypot
      - docker compose up -d
  EOF
}
