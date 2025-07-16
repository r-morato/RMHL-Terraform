# createLXC

This Terraform module allows you to provision one or more LXC containers on a Proxmox host using the Proxmox API and the Telmate Terraform provider.

---

## Purpose

The goal of this setup is to automate the creation of lightweight LXC containers in your homelab or Proxmox cluster. Rather than manually cloning and configuring containers via the Proxmox GUI, you can define everything as code — making it reproducible, fast, and consistent.

---

## Features

- Declarative container creation using Terraform.
- Supports multiple containers with a loop.
- Automatically configures network, CPU, memory, and storage.
- Clones from a predefined template container (ID 100 by default).
- Supports unprivileged LXC containers for security.

---

## Repository Layout

```
createLXC/
├── main.tf             # Core logic for provisioning LXC containers
├── provider.tf         # Terraform and provider setup
├── variables.tf        # Input variables
└── README.md           # This file
```

---

## Prerequisites

- A running Proxmox VE node or cluster
- An LXC container template with VMID 100 (or modify the `clone` value)
- Proxmox API token with required permissions
- Terraform v1.3+ with Telmate Proxmox provider

---

## Example Usage

```hcl
variable "containers" {
  default = [
    {
      hostname = "web01"
      ip       = "192.168.1.101"
      memory   = 512
      cores    = 1
    },
    {
      hostname = "web02"
      ip       = "192.168.1.102"
      memory   = 512
      cores    = 1
    }
  ]
}
```

`terraform.tfvars`:

```hcl
pm_api_url         = "https://proxmox.local:8006/api2/json"
pm_user            = "terraform@pve!tokenid"
pm_api_token       = "your-proxmox-api-token"
proxmox_node       = "pve"
gateway            = "192.168.1.1"
container_password = "changeme"
rootfs_storage     = "local-lvm"
```

---

## How It Works

- Each LXC is cloned from the template VMID `100`.
- Hostname, IP, CPU cores, memory, and storage are assigned from `containers` list.
- All containers will boot with the given root password.
- Containers are configured with static IP and the provided gateway.

---

## Tips

- Use a cloud-init enabled container template if you want advanced provisioning.
- To destroy and re-create containers safely, make sure you're not depending on persistent data inside them.
- You can change the base template VMID in `main.tf` (`clone = 100`) to match your actual base.

---

## Final Notes

This is a lightweight and powerful way to manage Proxmox LXC containers via Infrastructure as Code. Ideal for automating service containers in a homelab environment or for quick service rollout in testing labs.