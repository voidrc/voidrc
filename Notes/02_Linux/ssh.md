### On Each Lab PC

1. **Install the OpenSSH server**
   Most distros already have this, but confirm:

```bash
sudo pacman -S openssh
```

2. **Enable and start the SSH service**

```bash
sudo systemctl enable sshd --now
```

3. **Verify it’s running**

```bash
systemctl status sshd
```

You should see `active (running)`.

4. **(Optional) Allow firewall access**
   If `ufw` or `firewalld` is running:

```bash
# For UFW
sudo ufw allow ssh

# For firewalld
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
```

5. **Find the PC’s IP address**

```bash
ip a | grep inet
```

Look for something like `192.168.x.x` under `wlan0` or `enp*`.

---

## From Admin Node

You can now remotely connect like this:

```bash
ssh student@192.168.x.x
```

> Replace 192.168.x.x` with the IP of the lab PC.

---

## Optional: Make It Easier with SSH Key Auth

If you want **passwordless and secure** login:

1. **Generate a key on your laptop (if you haven’t already)**:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/lab_key
```

2. **Copy your public key to the lab PC**:

```bash
ssh-copy-id -i ~/.ssh/lab_key.pub student@192.168.x.x
```

3. **Connect using your key**:

```bash
ssh -i ~/.ssh/lab_key student@192.168.x.x
```

---

## Optional: Batch Manage Multiple PCs

You can write a quick loop or use tools like `Ansible` or `pssh` to push commands to multiple lab machines at once.

Simple loop example:

```bash
for ip in 192.168.1.{2..255}; do
  ssh student@$ip "sudo pacman -Syu --noconfirm"
done
```
