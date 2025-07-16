output "vmid" {
  description = "Proxmox VM ID"
  value       = proxmox_vm_qemu.honeypot.vmid
}

output "vm_ip" {
  description = "VM IP address (you may need to retrieve via DHCP or manually)"
  value       = "<check your DHCP or Proxmox DHCP leases>"
}
