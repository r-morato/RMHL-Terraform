# RMHL-Terraform

This repository contains the infrastructure code for my homelab, managed with Terraform. It helps define and provision virtual machines, containers, and networking inside my Proxmox environment.

---

## Purpose

The main goal of this setup is to make managing homelab infrastructure easier, more consistent, and repeatable. Instead of setting things up manually in Proxmox, I use Terraform to describe what the setup should look like — then apply those changes automatically.

Some key benefits:

- Infrastructure is defined in code, so it's versioned and auditable.
- Easier to make updates or roll back mistakes.
- Integrated with my automation tools, so I don’t have to run everything manually.

---

## What’s Covered

This setup currently manages:

- **Proxmox VMs (KVM):** Define CPU, RAM, disk, and network settings.
- **LXC Containers:** Lightweight containers for running services.
- **Networking:** Virtual bridges and interfaces.
- **Storage:** Disk attachments from Proxmox storage pools.

---

## Repository Layout

Here’s how the repo is organized:

```
.
├── modules/               # Shared modules for VMs, LXCs, etc.
├── projects/              # Configs for specific services or deployments
│   ├── lxc_bases/         # Base container setups (e.g. Pi-hole, UptimeKuma)
│   └── vms/               # VM-specific configs
├── main.tf                # Entry point for Terraform
├── variables.tf           # Input variables
├── outputs.tf             # Output values
└── .terraform/            # Auto-generated directory by Terraform
```

---

## Automation with Semaphore

This repo is tied into a larger automation stack using **Ansible** and **Semaphore**.

- **Semaphore** lets me run automation tasks from a web UI.
- **Ansible** handles the playbooks that run Terraform commands.
- **Terraform** does the actual provisioning.

This makes it easy to apply infrastructure changes from anywhere without logging into the Proxmox UI.

---

## Getting Started

To use this repo locally:

```bash
git clone https://github.com/YourGitHubUsername/RMHL-Terraform.git
cd RMHL-Terraform
terraform init
terraform plan
terraform apply
```

Make sure your Terraform provider for Proxmox is configured correctly.

---

## Final Notes

This project is part of my broader homelab setup. It’s designed to be easy to manage, update, and scale over time. Using Terraform helps me keep everything consistent and avoids surprises when things change.

Still a work in progress — and probably always will be — but that’s the point.
