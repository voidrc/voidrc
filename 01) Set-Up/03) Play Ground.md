now we set up our main machine. are we ready to go out and test the limits of law?  
**ABSOLUTELY FUCKING NOT.**

what you gonna do without training? flex with `_cmatrix_` someone else wrote? sit down. here’s your cure:  
➡️ go to [HackMyVM](https://hackmyvm.eu), grab dummy targets, and break them guilt-free.  
but first — never run live malware straight on your main rig unless you enjoy reinstalling arch at 3am. 

my advice: build a **sandbox**.

since i roll with **cachyos**, guide is tuned for that. if you use another distro… cope.

---
## Virtual Box
type 2 hyprvisor, complete isolation, commonly used, but resource heavy

### 1. install required packages

make sure you got every single virtualbox piece:
```bash
sudo pacman -Sy virtualbox virtualbox-host-dkms virtualbox-guest-iso virtualbox-ext-oracle
```

### 2. load kernel modules

virtualbox needs kernel modules to spin fake nets:
```bash
sudo modprobe vboxdrv vboxnetadp vboxnetflt
```

make ‘em autoload:
```bash
sudo tee /etc/modules-load.d/virtualbox.conf <<EOF
vboxdrv
vboxnetadp
vboxnetflt
EOF
```

### 3. rebuild kernel modules

after kernel updates this step saves your ass:
```bash
sudo vboxreload
```

### 4. join the cult (`vboxusers`)

```bash
sudo usermod -aG vboxusers $USER
```

log out + back in. no shortcuts.

### 5. (optional) secure boot bs

if secure boot haunts you:
```bash
sudo pacman -S virtualbox-secureboot
sudo virtualbox-secureboot enroll
```

reboot + enroll key in bios/uefi.

### troubleshooting

- **kernel headers mismatch?** match your kernel:
```bash
uname -r
sudo pacman -S linux-headers
```

- **still broken?** nuke + reload:
```bash
sudo rmmod vboxdrv vboxnetadp vboxnetflt
sudo modprobe vboxdrv vboxnetadp vboxnetflt
```

---
## Containers
