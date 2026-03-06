### Linux (any distro with NetworkManager)

Identify the network interface:
```bash
nmcli device
```

Example result:
```
enp108s0
```

Edit the connection:
```bash
nmcli connection edit enp108s0
```

Configure:
- Set IPv4 method to manual
```
set ipv4.method manual
```

- Assign static IP and subnet
```
set ipv4.addresses 172.16.0.11/24
```

- Save and exit
```
save
quit
```

Activate connection:
```bash
nmcli connection up enp108s0
```

Verify:
```bash
ip addr show enp108s0
```

---

### macOS
System Settings → Network → Ethernet → TCP/IP
- Configure IPv4: **Manually**
- IP address: **172.16.0.10**
- Subnet mask: **255.255.255.0**
- Router: leave empty