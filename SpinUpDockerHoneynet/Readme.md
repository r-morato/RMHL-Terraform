# Proxmox-Terraform-DockerHoneynet

This project uses Terraform to deploy a dedicated Docker-based honeypot VM in a Proxmox environment. The honeypot runs Cowrie with a web-based log viewer, all containerized with Docker Compose.

---

## Purpose

This setup provides a reproducible, automated way to spin up a honeypot VM for monitoring unauthorized access attempts. It's intended for homelab security experimentation and learning.

---

## Features

- Deploys a full VM via Proxmox using Terraform.
- Boots with cloud-init to install Docker, clone the honeypot repo, and launch the stack automatically.
- Integrated Cowrie honeypot and real-time log viewer.
- Parameterized for different storage, networks, and VM specs.
- Easy to integrate into existing automation pipelines.

---

## Repository Layout

```
SpinUpDockerHoneynet/
├── main.tf             # Main Terraform logic
├── variables.tf        # Input variables
├── outputs.tf          # Outputs like VM ID or IP
├── terraform.tfvars    # Your secrets and settings (excluded from repo)
└── README.md           # This file
```

---

## Prerequisites

- Proxmox server or cluster with API access
- A cloud-init enabled Linux template (e.g. Ubuntu 22.04)
- Terraform >= 1.3.0
- Proxmox provider for Terraform installed

---

## Getting Started

### 1. Clone this repo and enter the directory


### 2. Fill in `terraform.tfvars`

```hcl
proxmox_api_url      = "https://proxmox.example.com:8006/api2/json"
proxmox_user         = "root@pam"
proxmox_password     = "yourpassword"
proxmox_node         = "pve"
proxmox_storage      = "local-lvm"
proxmox_bridge       = "vmbr0"
vm_password          = "honeypotpass"
```

### 3. Run Terraform

```bash
terraform init
terraform plan
terraform apply
```

This will create a VM, install Docker, pull your Docker-Honeynet repo, and run it automatically.

---

## Security Note

This VM is intended to attract unauthorized access. You should:

- Deploy it on an isolated VLAN or dedicated node
- Monitor logs actively
- Avoid exposing Proxmox or critical services on the same subnet

---

## Future Enhancements

- Output actual IP from cloud-init DHCP lease
- Automate reverse proxy or log shipping
- Add alerting tools (Loki, ELK, Slack alerts)

---

## Final Notes

This module integrates well with a Proxmox-based homelab using IaC (Infrastructure as Code) practices. It helps keep honeypot deployments reproducible, disposable, and secure.
