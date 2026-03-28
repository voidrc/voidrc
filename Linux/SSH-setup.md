**Goal:** secure, passwordless SSH login using key authentication.

Network:

- Athena (Mac) → `172.16.0.10`
- Medusa (ASUS) → `172.16.0.11`
- SSH port → `22`

This guide assumes you want to SSH **from Mac to ASUS** (control plane → host).  
Optional steps for reverse access are included at the end.

---
### Install OpenSSH
```bash
sudo pacman -S openssh
```

### Enable and start SSH service
```bash
sudo systemctl enable sshd
sudo systemctl start sshd
```

### Verify service is running
```bash
sudo systemctl status sshd
```

### Confirm port is listening
```bash
ss -tlnp | grep :22
```


---
### Copy Public Key to Server
```bash
ssh-copy-id USER@IP
```

Enter USER password once.  
This installs the key into:
```
~/.ssh/authorized_keys
```

---
### Test Passwordless Login
```bash
ssh USER@IP
```

You should log in **without password prompt**  
(passphrase prompt may appear if you set one).

---

### (Recommended) Disable Password Authentication

Only do this **after confirming key login works**.

On server:
```bash
sudo vim /etc/ssh/sshd_config
```

Change or set:
```
PasswordAuthentication no
PubkeyAuthentication yes
```

Restart SSH:
```bash
sudo systemctl restart sshd
```

Now login is key-only.

---

### Optional: Create SSH Host Alias

Edit config:
```bash
vim ~/.ssh/config
```

Add:
```
Host SERVER
    HostName IP
    User USER
    IdentityFile ~/.ssh/id_ed25519
```

Now connect with:
```bash
ssh SERVER
```