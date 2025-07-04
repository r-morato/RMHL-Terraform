# RMHL-Terraform
This repository contains the Infrastructure as Code (IaC) definitions for my homelab, managed using Terraform. It defines and provisions the foundational virtual infrastructure within the homelab environment.

## Purpose

The primary goal of this repository is to:

* **Define Infrastructure Declaratively:** Specify the desired state of virtual machines (VMs), Linux Containers (LXCs), and related network/storage configurations on the Proxmox Virtual Environment using Terraform's HashiCorp Configuration Language (HCL).
* **Automate Provisioning:** Enable consistent, repeatable, and automated deployment of homelab infrastxructure resources.
* **Version Control:** Track all infrastructure changes, allowing for rollbacks and clear auditing of infrastructure evolution.
* **Integration with Automation Tools:** Designed to be executed via Semaphore, providing a web-based interface for triggering Terraform runs and managing credentials.

## Scope of Automation

Currently, this repository focuses on managing the following aspects of the homelab infrastructure:

* **Proxmox Virtual Machines (KVM):** Definition of VM specifications (CPU, RAM, disk, network).
* **Proxmox Linux Containers (LXC):** Definition of LXC specifications and base OS templates.
* **Virtual Networking (within Proxmox):** Management of virtual bridges and network interfaces for VMs/LXCs.
* **Virtual Storage:** Attachment of virtual disks to VMs/LXCs from defined Proxmox storage pools. 

## Repository Structure

The repository is organized by logical infrastructure components or projects. Typical structure may include:

* `.terraform/`: Terraform's working directory (auto-generated).
* `modules/`: Reusable Terraform modules for common infrastructure patterns (e.g., a generic LXC module).
* `environments/` or `projects/`: Top-level configurations for different infrastructure deployments or environments.
    * `lxc_bases/`: Definitions for standard LXCs (e.g., Pi-hole LXC, UptimeKuma LXC).
    * `vms/`: Definitions for specific VMs (if any are not LXCs).
* `main.tf`, `variables.tf`, `outputs.tf`: Standard Terraform configuration files.

## Usage with Semaphore

This repository is integrated with the **Homelab Automation (Ansible/Semaphore)** system. Terraform plans and applies are executed via Ansible playbooks (e.g., `run_terraform_apply.yml`) that are managed and triggered through the Semaphore web interface.

## Getting Started (Development)

To work with these Terraform configurations locally:

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/YourGitHubUsername/RMHL-Terraform.git](https://github.com/YourGitHubUsername/RMHL-Terraform.git)
    cd RMHL-Terraform
    ```
2.  **Initialize Terraform:**
    ```bash
    terraform init
    ```
3.  **Plan Changes:**
    ```bash
    terraform plan
    ```
4.  **Apply Changes:**
    ```bash
    terraform apply
    ```


---
