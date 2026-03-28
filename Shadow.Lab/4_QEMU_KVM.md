# QEMU/KVM — Virtualization Setup

## what is QEMU/KVM?

QEMU/KVM is a virtualization stack built into the Linux kernel. it's what powers the lab environment used in this guide.

compared to VirtualBox:
- **faster** — VMs run closer to native speed via hardware virtualization
- **more control** — networking, snapshots, storage are all configurable at a low level
- **CLI-first** — you manage VMs with tools like `virsh` and `virt-install`

> this is the setup used throughout chapter 1. if you're on Arch, these commands work as-is. other distros may have different package names.

---

## step 1: install the virtualization stack

update the system and install everything needed:
```bash
sudo pacman -Syu qemu-full virt-manager libvirt dnsmasq ebtables iptables-nft edk2-ovmf virt-install
```

**what these do:**

| package        | purpose                                      |
| -------------- | -------------------------------------------- |
| `qemu-full`    | the emulator/hypervisor core                 |
| `virt-manager` | GUI frontend for managing VMs                |
| `libvirt`      | daemon that manages virtualization resources |
| `dnsmasq`      | DHCP and DNS for virtual networks            |
| `iptables-nft` | firewall rules (required for NAT networking) |
| `edk2-ovmf`    | UEFI firmware support for VMs                |
| `virt-install` | CLI tool for creating VMs                    |

---

## step 2: enable libvirt

enable and start the libvirt daemon:
```bash
sudo systemctl enable --now libvirtd
```

add yourself to the `libvirt` group so you can manage VMs without `sudo`:
```bash
sudo usermod -aG libvirt $USER
```

> log out and back in (or reboot) for the group change to take effect.

verify it's working:
```bash
virsh --connect qemu:///system list --all
```

check available virtual networks:
```bash
virsh net-list --all
```

---

## step 3: create the lab network (lab-net)

the lab uses a custom NAT network called `lab-net`. this gives all VMs a private internal network with internet access via NAT.

create the network definition file:
```bash
sudo vim /tmp/lab-net.xml
```

paste in this configuration:
```xml
<network>
  <name>lab-net</name>
  <forward mode='nat'/>
  <bridge name='virbr10' stp='on' delay='0'/>
  <domain name='shadow_lab'/>
  <ip address='10.10.10.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='10.10.10.2' end='10.10.10.200'/>
    </dhcp>
  </ip>
</network>
```

**what this defines:**
- network name: `lab-net`
- bridge interface: `virbr10`
- internal domain: `shadow_lab`
- gateway: `10.10.10.1`
- DHCP range: `10.10.10.2 – 10.10.10.200`

> save a copy of this file in your repo for reproducibility.

register, start, and enable the network:
```bash
sudo virsh net-define /tmp/lab-net.xml
sudo virsh net-start lab-net
sudo virsh net-autostart lab-net
```

verify:
```bash
sudo virsh net-list --all
sudo virsh net-info lab-net
```

---

## next-step

- [VM creation](5_controling_vms.md)

optional reference:
- [Shadow.Lab map](Shadow.Lab/README.md)

global path:
- [Journey](../../JOURNEY.md)
- [Progress Tracker](../../PROGRESS_TRACKER.md)
