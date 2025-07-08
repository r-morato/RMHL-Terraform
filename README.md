# RMHL-Terraform

Welcome to the Terraform side of my homelab — the part that brings order to the chaos. This repo holds the infrastructure definitions that shape and power everything running in my Proxmox environment. It's all about keeping things declarative, consistent, and easy to rebuild when (not if) something goes sideways.

---

## Why This Exists

I wanted to manage my infrastructure like code — because it *is* code. No more clicking through endless UI menus in Proxmox. Instead, I define exactly what each VM, container, bridge, and disk should look like using Terraform. It’s clean, version-controlled, and easy to automate.

The real reason, though? I got tired of guessing what changed last week. With Terraform, every change is tracked, auditable, and reversible. It's also a lot more fun.

---

## What It Handles

This repo doesn’t try to do everything — just the important bits. Right now, it’s focused on defining and provisioning the core infrastructure inside Proxmox:

- **Virtual Machines (KVM):** Specs like CPU, memory, storage, and network — all codified.
- **Linux Containers (LXC):** Lightweight services get their own containerized homes.
- **Networking:** Bridges and interfaces are all defined virtually within Proxmox.
- **Storage:** VMs and LXCs can mount the storage they need from predefined pools.

It’s modular, too — so spinning up a new LXC with a specific template or config takes just a few lines of HCL.

---

## Structure at a Glance

Here’s how things are laid out:

```
.
├── modules/               # Reusable Terraform modules (e.g., LXC/VM templates)
├── projects/              # Top-level configurations for deployments
│   ├── lxc_bases/         # Predefined containers (Pi-hole, UptimeKuma, etc.)
│   └── vms/               # Any non-LXC virtual machines
├── main.tf                # Main Terraform config entry
├── variables.tf           # Inputs for configs
├── outputs.tf             # Outputs from infrastructure
└── .terraform/            # Terraform working directory (auto-generated)
```

---

## Automation: Ansible + Semaphore

Terraform is only part of the story. This repo ties into a broader automation pipeline that includes **Ansible** and **Semaphore**.

- **Semaphore** provides a clean web UI to kick off runs.
- **Ansible** handles playbooks that wrap Terraform commands.
- **Terraform** executes the plan and provisions infrastructure.

Typical flow:

1. Semaphore triggers an Ansible playbook.
2. Playbook runs `terraform plan` and `terraform apply`.
3. Infrastructure updates without you ever logging into Proxmox.

---

## Getting Started

Want to try it locally? Here’s the quickstart:

```bash
git clone https://github.com/YourGitHubUsername/RMHL-Terraform.git
cd RMHL-Terraform
terraform init
terraform plan
terraform apply
```

Make sure your Proxmox credentials and provider config are set up before running anything.

---

## Final Notes

This repo is one piece of a bigger system — a homelab designed to be clean, modular, and mostly self-maintaining. Terraform helps keep everything predictable and version-controlled, while leaving plenty of room to grow and experiment.

Whether you're managing a few services or an entire fleet of LXCs, infrastructure-as-code makes life easier — and honestly, a lot more fun.
