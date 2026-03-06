## Prepare storage directories (ASUS host)

```bash
sudo mkdir -p ~/KVM/{iso,vm,backups,containers}
sudo chmod -R 755 ~/KVM
```

Put Fedora Server ISO files in:
```
~/KVM/iso/
```

Example:
```
~/KVM/iso/Fedora-Server-43.iso
```

---

## Create Fedora Server VMs

All VMs use:
- network: `lab-net`
- disk bus: `virtio`
- console install (no GUI)    
- CPU passthrough

Tip: Fedora has proper OS variants. Use a real one
Check available variants
```bash
osinfo-query os | grep fedora
```

Example below uses `fedora43`.

---

## Create bastion VM
```bash
sudo virt-install \
  --name bastion \
  --memory 4096 \
  --vcpus 4 \
  --cpu host-model \
  --disk path=vm/bastion.qcow2,size=64,format=qcow2,bus=virtio \
  --os-variant fedora43 \
  --network network=lab-net,model=virtio \
  --network type=direct,source=enp108s0,source_mode=bridge,model=virtio \
  --graphics spice \
  --video virtio \
  --console pty,target_type=serial \
  --serial pty \
  --cdrom iso/Fedora-Server-43-x86_64.iso
```

---

---

## Create srv1 VM
```bash
sudo virt-install \
  --name srv1 \
  --memory 2048 \
  --vcpus 2 \
  --cpu host \
  --disk path=vm/srv1.qcow2,size=20,format=qcow2,bus=virtio \
  --os-variant fedora39 \
  --network network=lab-net,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --serial pty \
  --cdrom iso/Fedora-Server-39-x86_64.iso
```

---

## Create cli1 VM
```bash
sudo virt-install \
  --name cli1 \
  --memory 1536 \
  --vcpus 1 \
  --cpu host \
  --disk path=vm/cli1.qcow2,size=15,format=qcow2,bus=virtio \
  --os-variant fedora39 \
  --network network=lab-net,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --serial pty \
  --cdrom iso/Fedora-Server-39-x86_64.iso
```

---
## Fedora VM baseline configuration (each VM)
During or after install:
### Hostname
```bash
sudo hostnamectl set-hostname bastion
sudo hostnamectl set-hostname srv1
sudo hostnamectl set-hostname cli1
```

---
### Enable SSH server
```bash
sudo systemctl enable --now sshd
```

---
### Create non-root admin user
```bash
sudo useradd -m -G wheel username
sudo passwd username
```

Enable sudo for wheel (if not already):
```bash
sudo visudo
```

Ensure:
```
%wheel ALL=(ALL) ALL
```

---
### Update system
```bash
sudo dnf upgrade -y
```

---
### Install base tools
```bash
sudo dnf install -y git vim tcpdump bind-utils
```

---
## Record VM IP addresses

On each VM:
```bash
ip a
```

or from host:
```bash
sudo virsh domifaddr bastion
sudo virsh domifaddr srv1
sudo virsh domifaddr cli1
```
