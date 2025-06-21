variable "pm_api_url" {}
variable "pm_user" {}
variable "pm_api_token" {}
variable "container_password" {}
variable "gateway" {}
variable "proxmox_node" {}
variable "template_storage" {}
variable "template_path" {}
variable "rootfs_storage" {}

variable "containers" {
  type = list(object({
    hostname = string
    ip       = string
    cores    = number
    memory   = number
  }))
}
