## Current Hardware

`shadow.lab` is chapter 1 of the Phase 1.

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

## phase 1 order

follow this order inside chapter 1:
1. [Linux Distros](./docs/distros.md)
2. [Installing Distro](./docs/distro_instalation.md)
3. [Arming Up](./docs/need_to_have.md)
4. [QEMU/KVM setup](./docs/QEMU_KVM.md)
5. [VM creation](controling_vms.md)

## next-step

continue here:
- [SysAdmin/README.md](../SysAdmin/README.md)

global path:
- [Ultimate Journey Protocol](../JOURNEY.md)
- [Progress Tracker](../PROGRESS_TRACKER.md)
