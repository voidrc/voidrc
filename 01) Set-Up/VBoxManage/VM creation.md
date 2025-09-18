Variables:
```bash
VM="name"
ISOpath="/path/to/iso"
```

List the available guest OS types:
```bash
VBoxManage list ostypes
```

Create the virtual machine:
```bash
VBoxManage createvm --name $VM --ostype "Debian_64" --register
```
The VM has a unique UUID.
An XML settings file is generated.

---
**Create storage devices for the VM**:
- Create a SATA storage controller:
```bash
VBoxManage storagectl $VM --name "SATA Controller" --add sata --controller IntelAHCI
```

- Create a 32768 MB virtual hard disk for the VM.
```bash
VBoxManage createhd --filename /../$VM/$VM.vdi --size 32768
```

- Attach the virtual hard disk.
```bash
VBoxManage storageattach $VM --storagectl "SATA Controller" --port 0 --device 0 \
--type hdd --medium /../$VM/$VM.vdi
```

- Create an IDE storage controller for a virtual DVD drive:
```bash
VBoxManage storagectl $VM --name "IDE Controller" --add ide
```

- Attach an installation ISO:
```bash
VBoxManage storageattach $VM --storagectl "IDE Controller" --port 0 --device 0 \
--type dvddrive --medium $ISOpath
```

---
**Configure some settings for the VM:**
- Enable I/O APIC for VM motherboard:
```bash
VBoxManage modifyvm $VM --ioapic on
```

- Configure boot order for VM:
```bash
VBoxManage modifyvm $VM --boot1 dvd --boot2 disk --boot3 none --boot4 none
```

- Allocate 8192MB RAM and 128MB vRAM to VM:
```bash
VBoxManage modifyvm $VM --memory 8192 --vram 128
```

---
**Specify the Unattended Installation parameters**:
- Specify target system ISO as installation ISO:
```bash
VBoxManage unattended install $VM \
--iso=$ISOpath \
```

- Specify user parameters on the guest OS:
```bash
--user=login --full-user-name=name --user-password password \
```
> Note that the specified password is also used for the root user account on the guest

- Specify that you want to install the VirtualBox Guest Additions on the VM:
```bash
--install-additions \
```

- Sets the time zone for the guest OS:
```bash
--time-zone=timezone
```

---
**Start VM**:
```bash
VBoxManage startvm $VM --type="gui|headless|sdl|separate"
```