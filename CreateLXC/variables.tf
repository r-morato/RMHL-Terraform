variable "pm_api_url" {}
variable "pm_user" {}
variable "pm_api_token" {}

variable "container_password" {}
variable "gateway" {}
variable "template_storage" {}
variable "template_path" {}
variable "rootfs_storage" {}
variable "proxmox_node" {}

# Optional - if you're creating multiple containers using a loop
variable "containers" {
  description = "List of container configs"
  type        = any
  default     = []
}
