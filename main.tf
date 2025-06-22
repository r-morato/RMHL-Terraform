provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id    = var.pm_user
  pm_api_token_secret = var.pm_api_token
  pm_tls_insecure     = true
}

resource "proxmox_lxc" "homelab_container" {
  count     = length(var.containers)
  hostname  = var.containers[count.index].hostname
  target_node = var.proxmox_node
  ostemplate   = "${var.template_storage}:${var.template_path}"
  password  = var.container_password
  cores     = var.containers[count.index].cores
  memory    = var.containers[count.index].memory
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${var.containers[count.index].ip}/24"
    gw     = var.gateway
  }
  rootfs {
    storage = var.rootfs_storage
    size = "4G"
  }
  start = true
  unprivileged = true
}
