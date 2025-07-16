# RMHL-Terraform

This repository contains Infrastructure-as-Code (IaC) configurations for managing and automating my homelab environment using [Terraform](https://www.terraform.io/) and [Proxmox](https://www.proxmox.com/en/). Each subdirectory represents a separate use case and is modular enough to be adapted independently.

---

## 📦 Repository Structure

```
RMHL-Terraform/
├── SpinupWinServer/       # Clone and deploy Windows Server VMs from a template
├── SpinUpDockerHoneynet/  # Deploy a Docker-based honeynet for network security monitoring
├── CreateLXC/             # Provision lightweight Proxmox LXC containers
└── README.md              # This file
```

---

## 🔧 Use Cases

### 1. **SpinupWinServer**

Clone and provision a full Windows Server virtual machine from a pre-built Proxmox template using Terraform. Ideal for setting up a fresh Windows environment consistently across test or lab environments.

- ✅ Uses `proxmox_vm_qemu`
- ✅ Full cloning support
- ✅ Minimal configuration required

➡️ [View SpinupWinServer](./SpinupWinServer)

---

### 2. **SpinUpDockerHoneynet**

Deploy a lightweight, containerized honeynet using Docker. This setup helps monitor, log, and analyze suspicious activity in isolated environments. A great tool for learning network security and intrusion detection.

- 🔐 Security-focused
- 🐳 Runs with Docker Compose
- 📊 Potential to integrate logging and dashboards (e.g. ELK, Grafana)

➡️ [View SpinUpDockerHoneynet](./SpinUpDockerHoneynet)

---

### 3. **CreateLXC**

Use Terraform to define and provision multiple LXC containers on a Proxmox node. Supports multiple container instances via a simple list structure, and includes rootfs, network, and resource configurations.

- 🪶 Lightweight, unprivileged containers
- ♻️ Ideal for service orchestration in homelabs
- 📜 Declarative configs for scalability

➡️ [View CreateLXC](./CreateLXC)

---

## 🚀 Getting Started

To use any of the modules:

```bash
cd RMHL-Terraform/<ModuleName>
terraform init
terraform plan
terraform apply
```

Each folder contains its own `README.md`, configuration files, and variable definitions. Review and populate the appropriate `terraform.tfvars` before running.

---

## 🧠 Why Use This?

- Infrastructure is **version-controlled**, **documented**, and **repeatable**
- Consistent environments reduce human error and setup time
- Clean integration with homelab tools (e.g. Ansible, Semaphore)
- Encourages modular, testable, and secure homelab management

---

## 🛠️ Requirements

- Proxmox VE with API access enabled
- Terraform 1.3+
- Telmate Proxmox Provider
- Optional: Docker, Ansible, Semaphore

---

## 📌 Final Notes

This repository is a growing toolkit for managing a homelab more intelligently. It’s built to scale, automate, and secure lab deployments using modern DevOps principles.

Feel free to fork, modify, or suggest improvements. Your homelab should be fun *and* resilient.

---
