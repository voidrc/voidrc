# QEMU/KVM Practical Guide

A practical reference for day-to-day QEMU/KVM operations using Fedora Server as the example guest. Covers VM creation, lifecycle management, networking, storage, snapshots, and cloning.

> Prefer a TUI? Use [lazyKVM](https://github.com/voidrc/lazyKVM) to manage VMs interactively.

---

## 0) Prerequisites

Complete QEMU/KVM host setup first:

- [QEMU/KVM setup](4_QEMU_KVM.md)

Check host status:

```bash
virsh --connect qemu:///system list --all
virsh net-list --all
```

---

## 1) Prepare workspace

```bash
mkdir -p ~/KVM/{iso,images,snaps,exports}
chmod 755 ~/KVM ~/KVM/iso ~/KVM/images ~/KVM/snaps ~/KVM/exports
```

Put your ISO in `~/KVM/iso`.

Example:

```text
~/KVM/iso/Fedora-Server-dvd-x86_64-43-1.4.iso
```

Find available Fedora variants:

```bash
osinfo-query os | grep -i fedora
```

---

## 2) Create a VM (Fedora Server example)

Use this as a reusable template.

```bash
cd ~/KVM
sudo virt-install \
  --name fedora-lab-01 \
  --memory 2048 \
  --vcpus 2 \
  --cpu host-passthrough \
  --disk path=images/fedora-lab-01.qcow2,size=25,format=qcow2,bus=virtio \
  --os-variant fedora43 \
  --network network=lab-net,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --serial pty \
  --cdrom iso/Fedora-Server-dvd-x86_64-43-1.4.iso
```

Useful options:

- `--memory` and `--vcpus`: allocate resources
- `--disk`: create VM disk image
- `--network`: attach to libvirt network
- `--graphics none`: headless install
- `--console` and `--serial`: terminal-based install access

---

## 3) VM lifecycle commands

List VMs:

```bash
virsh list --all
```

Start / stop / force stop:

```bash
sudo virsh start fedora-lab-01
sudo virsh shutdown fedora-lab-01
sudo virsh destroy fedora-lab-01
```

Autostart at host boot:

```bash
sudo virsh autostart fedora-lab-01
```

Open serial console:

```bash
sudo virsh console fedora-lab-01
```

Exit console: press `Ctrl+]`

---

## 4) Networking essentials

Check networks:

```bash
virsh net-list --all
```

Inspect a network:

```bash
virsh net-info lab-net
virsh net-dumpxml lab-net
```

Start/stop network:

```bash
sudo virsh net-start lab-net
sudo virsh net-destroy lab-net
```

Enable autostart:

```bash
sudo virsh net-autostart lab-net
```

Check DHCP leases:

```bash
sudo virsh net-dhcp-leases lab-net
```

Find VM IP:

```bash
sudo virsh domifaddr fedora-lab-01
```

---

## 5) Storage essentials

### Disk images

List disk image files:

```bash
ls -lh ~/KVM/images
```

Inspect qcow2 details:

```bash
qemu-img info ~/KVM/images/fedora-lab-01.qcow2
```

Resize a disk image:

```bash
qemu-img resize ~/KVM/images/fedora-lab-01.qcow2 +10G
```

Note: after resizing, also extend the partition/filesystem inside the guest.

### Optional: libvirt storage pool

```bash
sudo virsh pool-define-as kvm-images dir - - - - "/home/$USER/KVM/images"
sudo virsh pool-start kvm-images
sudo virsh pool-autostart kvm-images
virsh pool-list --all
```

---

## 6) Snapshots

Create snapshot (running VM):

```bash
sudo virsh snapshot-create-as --domain fedora-lab-01 --name pre-update --description "Before system update"
```

List snapshots:

```bash
virsh snapshot-list fedora-lab-01
```

Revert to snapshot:

```bash
sudo virsh snapshot-revert fedora-lab-01 pre-update
```

Delete snapshot:

```bash
sudo virsh snapshot-delete fedora-lab-01 pre-update
```

Tip: snapshots are excellent before risky package upgrades or config changes.

---

## 7) Clone and export

Clone an existing VM:

```bash
sudo virt-clone \
  --original fedora-lab-01 \
  --name fedora-lab-02 \
  --file ~/KVM/images/fedora-lab-02.qcow2
```

Backup a VM disk (cold backup recommended):

```bash
sudo virsh shutdown fedora-lab-01
cp ~/KVM/images/fedora-lab-01.qcow2 ~/KVM/exports/
```

---

## 8) Cleanup and remove VM safely

```bash
sudo virsh shutdown fedora-lab-01
sudo virsh undefine fedora-lab-01 --remove-all-storage
```

Use `--remove-all-storage` carefully. It deletes VM disks permanently.

---

## Quick troubleshooting

VM does not start:

- check VM XML: `virsh dumpxml fedora-lab-01`
- check libvirt logs: `journalctl -u libvirtd -b`

No network inside VM:

- verify `lab-net` is active
- check DHCP leases
- restart guest network service

No serial console output:

- confirm guest was installed with serial console support
- use `virt-manager` once for recovery if needed

---

## next-step

- [soon]()

optional reference:

- [Shadow.Lab map](Shadow.Lab/README.md)

global path:

- [Journey](../../JOURNEY.md)
- [Progress Tracker](../../PROGRESS_TRACKER.md)
