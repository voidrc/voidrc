## QEMU/KVM
Update the system and install the full virtualization stack:
```bash
sudo pacman -Syu qemu-full virt-manager libvirt dnsmasq ebtables iptables-nft edk2-ovmf virt-install
```

Enable libvirt to start automatically at boot and start it now:
```bash
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

Add your user to the **libvirt** group to manage virtual machines without root privileges:
```bash
sudo usermod -aG libvirt $USER
```
> Log out and log back in (or reboot) for group changes to take effect.

Check that libvirt can connect to the system hypervisor and list virtual machines:
```bash
virsh --connect qemu:///system list --all
```

Check available virtual networks:
```bash
virsh net-list --all
```

---
### Create a Custom libvirt Network (lab-net)

Create the network definition file on the ASUS system:
```bash
sudo vim /tmp/lab-net.xml
```

Paste the following configuration:
```
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
This defines a NAT network with bridge `virbr10`, internal domain `shadow_lab`, and DHCP range `10.10.10.100–199`.

> Store a copy in your repository for reproducibility.

Register the network with libvirt:
```bash
sudo virsh net-define /tmp/lab-net.xml
```

Start the network:
```bash
sudo virsh net-start lab-net
```

Enable automatic start at boot:
```bash
sudo virsh net-autostart lab-net
```

List all virtual networks:
```bash
sudo virsh net-list --all
```

View detailed information:
```bash
sudo virsh net-info lab-net
```
