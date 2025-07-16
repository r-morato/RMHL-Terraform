# Proxmox-Windows-VM-Terraform

This Terraform configuration automates the creation of a Windows Server virtual machine in Proxmox by cloning from a pre-configured template.

---

## Purpose

The goal is to make deploying Windows Server VMs in your Proxmox homelab quick, consistent, and repeatable — all through Infrastructure as Code (IaC).

---

## Features

- Uses Proxmox API via the Telmate provider  
- Clones from a base Windows template (VMID 111)  
- Supports full cloning and sets VM to start on creation  
- Easily extendable to include networking, disk resizing, and cloud-init (if applicable)

---

## Repository Layout

```
windows-vm/
├── main.tf             # Terraform logic for cloning the VM
├── provider.tf         # Provider configuration
├── variables.tf        # Input variables
└── README.md           # This file
```

---

## Prerequisites

- Proxmox VE setup with API access  
- A pre-configured Windows Server VM template (VMID 111)  
- Terraform v1.3+ and the Telmate Proxmox provider  
- An API token with permission to clone and create VMs

---

## Setup Instructions

### 1. Fill in `terraform.tfvars`

```hcl
pm_api_url     = "https://proxmox.local:8006/api2/json"
pm_user        = "terraform@pve!tokenid"
pm_api_token   = "your-api-token"
proxmox_node   = "pve"
```

> Note: You can generate a Proxmox API token via the Proxmox GUI under Datacenter > Permissions > API Tokens.

---

### 2. Run Terraform

```bash
terraform init
terraform plan
terraform apply
```

Terraform will create a new full clone of VMID 111 on the specified Proxmox node.

---

## Notes

- The cloned template (VMID 111) should be pre-installed with Windows and optionally sysprepped.
- For automation and remote configuration, consider integrating cloud-init or other provisioning tools like Ansible or WinRM.
- You can modify this config to add disk, network, or ISO mounting options depending on your needs.

---

## Final Thoughts

This is a minimal, fast-start Terraform setup to spin up a Windows Server VM. You can easily expand on this to add more customization and automation as part of your infrastructure stack.
