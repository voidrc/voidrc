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
### Check Connection:
```bash
ssh username@172.16.0.11
```

Use your ASUS login password.  
If this works, networking and SSH service are correct.

Exit after testing:
```bash
exit
```

---
On macOS terminal:
```bash
ssh-keygen -t ed25519 -C "athena2medusa"
```

Press Enter to accept defaults.  
Optional: set passphrase (recommended).

This creates:
```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

---
### Copy Public Key to ASUS
```bash
ssh-copy-id username@172.16.0.11
```

Enter ASUS password once.  
This installs the key into:
```
~/.ssh/authorized_keys
```

---
### Test Passwordless Login
```bash
ssh username@172.16.0.11
```

You should log in **without password prompt**  
(passphrase prompt may appear if you set one).

---

### (Recommended) Disable Password Authentication

Only do this **after confirming key login works**.

On ASUS:
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

### Optional: Create SSH Host Alias (Mac)

Edit config:
```bash
vim ~/.ssh/config
```

Add:
```
Host medusa
    HostName 172.16.0.11
    User username
    IdentityFile ~/.ssh/id_ed25519
```

Now connect with:
```bash
ssh medusa
```

---

### Optional — Allow ASUS to SSH Into Mac

macOS SSH server is off by default.

Enable:
System Settings → General → Sharing → **Remote Login**

Allow your user.

Then from ASUS:
```bash
ssh mac_username@172.16.0.10
```

To set up passwordless in this direction, repeat key generation on ASUS and copy key to Mac.