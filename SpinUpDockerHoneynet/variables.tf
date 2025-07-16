variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_user" {
  description = "Proxmox username"
  type        = string
}

variable "proxmox_password" {
  description = "Proxmox password or API token"
  type        = string
  sensitive   = true
}

variable "proxmox_node" {
  description = "Proxmox node name to deploy VM"
  type        = string
}

variable "proxmox_storage" {
  description = "Proxmox storage to use for VM disk"
  type        = string
}

variable "proxmox_bridge" {
  description = "Proxmox network bridge to attach VM"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "docker-honeynet"
}

variable "vmid" {
  description = "Unique VM ID in Proxmox"
  type        = number
  default     = 9001
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "vm_disk_size" {
  description = "Disk size for VM"
  type        = string
  default     = "20G"
}

variable "vm_password" {
  description = "VM user password"
  type        = string
  sensitive   = true
}
