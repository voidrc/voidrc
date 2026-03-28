## Current Hardware

`shadow.lab` is chapter 1 of the active phase.

it exists to give you a safe place to build, break, restore, and document what happened.

- **ASUS ROG Strix G16 (16GB / 1.5TB + RTX 4060)** — CachyOS + QEMU/KVM + Docker
  Role: Development and gaming rig

- **500GB External HDD**  
   Encrypted DataBase and Logs

- **2 × 32GB USB drives**
  1. Installer / rescue media
  2. Encrypted transfer and toolkit

- **Unmanaged Gigabit Switch**  
   Stable wired connectivity for all devices (no VLAN support)

- **Remote Access**
  Tailscale

---

## Environment Preferences

- CLI-first workflow
- VM operating system: **Fedora Server**
- Home network: **172.16.0.0/24**
- Container strategy: VM-first deployment, later migration to **Docker**

---

## Device Roles

**ASUS**

- Development
- Testing
- KVM / libvirt host
- Gaming workstation

**External HDD**

- Encrypted DataBases
- Evidence storage for captures and snapshots

**USB #1**

- Bootable installer / recovery media

**USB #2**

- Encrypted transfer drive and portable toolkit

---

## Wiki Structure

```
Shadow.Lab/
    docs/
    inventory/
```

**Shadow.Lab**  
Part of the `voidrc` project. Functions as the homelab chapter.

**docs/**  
Simplified documentation for tools and scripts.

**inventory/**  
Configuration files, scripts, and supporting resources used in this environment.

---

## phase 1 order

follow this order inside chapter 1:

1. [docs/static-IP.md](./docs/static-IP.md)
2. [docs/SSH-setup.md](./docs/SSH-setup.md)
3. [docs/QEMU_KVM.md](./docs/QEMU_KVM.md)
4. [docs/basic-vm.md](./docs/basic-vm.md)
5. [docs/Recon.md](./docs/Recon.md)
6. [docs/NMAP.md](./docs/NMAP.md)
7. [docs/Scanning and Enemuration.md](./docs/Scanning%20and%20Enemuration.md)
8. [docs/Upgrading Shell.md](./docs/Upgrading%20Shell.md)
9. [docs/HoneyPot.md](./docs/HoneyPot.md)

when chapter 1 is stable, move to:

- [SysAdmin/README.md](../SysAdmin/README.md)

global path:

- [Ultimate Journey Protocol](../JOURNEY.md)
- [Progress Tracker](../PROGRESS_TRACKER.md)

---

## Basic Network Setup

This lab network operates in isolation — the switch is not connected to a router. Because there is no upstream router, there is **no DHCP service available** to automatically assign IP addresses.

Each device must therefore be configured with a **static IP address** manually.

### Step 1 — Configure Static IP Addresses

Follow the guide below to assign IP addresses, subnet mask, and (if needed) gateway values manually:
→ [Static IP Configuration](docs/static-IP.md)

Ensure that:

- Each device has a **unique IP address**
- All devices are in the **same subnet**
- The subnet mask is consistent across all machines

Once connectivity between devices is confirmed (e.g., successful `ping` tests), proceed to secure remote access.

### Step 2 — Configure Passwordless SSH Access

After the network is operational, set up SSH key-based authentication to allow secure, passwordless access between devices:
→ [SSH Setup Guide](docs/SSH-setup.md)

This will enable streamlined administration and automation without relying on password authentication.

---

## Virtualization

Once connectivity between devices has been established using static IP configuration and SSH access is working properly, you are ready to build your isolated lab environment.
At this stage, the physical network is functioning as the foundation. Now we move into virtualization to create controlled, reproducible, and segmented lab systems.
Follow the full setup instructions here:
→ [QEMU/KVM Setup Guide](docs/QEMU_KVM.md)

This guide covers:

- Installing required virtualization packages
- Configuring libvirt
- Creating virtual networks

After installing the required virtualization packages and configuring the virtual networks, proceed with building your first virtual machine.
Follow the instructions in:
→ [basic-vm](docs/basic-vm.md)

This guide walks you through creating the initial base VM, which will serve as the foundation for additional lab machines. Once completed, you can clone or adapt this base image to deploy role-specific servers within your isolated environment.

---

## next-step

continue here:

- [SysAdmin/README.md](../SysAdmin/README.md)

global path:

- [Ultimate Journey Protocol](../JOURNEY.md)
- [Progress Tracker](../PROGRESS_TRACKER.md)

---
