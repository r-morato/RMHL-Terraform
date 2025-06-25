provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id    = var.pm_user
  pm_api_token_secret = var.pm_api_token
  pm_tls_insecure     = true
}

resource "proxmox_lxc" "homelab_vm" {
  clone     = 100
  rootfs {
    storage = var.rootfs_storage
  }
  start = true
}
ß
