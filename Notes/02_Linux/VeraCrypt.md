## ⚡ Prerequisites

✅ VeraCrypt installed on Arch Linux.
If you don’t have it yet:

```bash
sudo pacman -S veracrypt
```

✅ Your external HDD is plugged in and mounted (so you can write to it).

---

## 📌 Step 1️⃣ Decide Where to Put It

First, identify the mount point of your external HDD.

Examples:

* `/run/media/$USER/ExternalHDD`
* `/mnt/mydrive`

You can check with:

```bash
lsblk
```

Or by just looking in your file manager.

**We’ll assume here:**

```
/run/media/$USER/ExternalHDD
```

But replace with your actual mount point if different.

---

## 📌 Step 2️⃣ Choose Name and Size

Examples:

* **Container filename**: `redteam_logs.hc`
* **Size**: 2GB (adjust as you want)

---

## 📌 Step 3️⃣ Run VeraCrypt in CLI or GUI

You can do this **graphically** or in **terminal**.

---

### ✅ 3A. Easy Way: Graphical Interface

If you want GUI:

1️⃣ Launch VeraCrypt:

```
veracrypt &
```

2️⃣ In the GUI:

* Click **Create Volume**.
* Choose **Create an encrypted file container** → **Next**.
* Choose **Standard VeraCrypt volume** → **Next**.
* **Select File** → navigate to your external HDD and enter:

```
/run/media/$USER/ExternalHDD/redteam_logs.hc
```

* Choose encryption (AES is fine) → **Next**.
* Enter size (e.g. 2000 MB) → **Next**.
* Set a strong password → **Next**.
* Filesystem (usually **ext4** or **exFAT** if you need Windows compatibility).
* Format.

✅ Done!

Your VeraCrypt container is now on your external HDD.

---

### ✅ 3B. Fully CLI Method (Advanced)

If you prefer *all terminal*, VeraCrypt also supports **--text** mode:

Example:

```bash
veracrypt --text --create /run/media/$USER/ExternalHDD/redteam_logs.hc
```

VeraCrypt will **prompt you interactively** for:

* Volume type (default = 1 = standard)
* Encryption algorithm (default AES)
* Hash (default SHA-512)
* Size (e.g. 2G)
* Password
* Filesystem (ext4, exFAT, etc.)

Example interactive session:

```
Volume type: 1
Encryption algorithm: 1
Hash algorithm: 1
Filesystem: 2
Enter volume size (e.g., 100M or 2G): 2G
Enter password: ********
```

✅ At the end it formats and creates the container file.

---

## 📌 Step 4️⃣ Mount the Container

Whenever you want to *open* it:

✅ Graphical:

* Launch VeraCrypt
* Select the container file
* Choose a slot
* Click **Mount**
* Enter password

✅ Command Line:

```bash
veracrypt --text --mount /run/media/$USER/ExternalHDD/redteam_logs.hc /mnt/veracrypt1
```

It will ask for the password, then mount it at `/mnt/veracrypt1`.

---

## 📌 Step 5️⃣ Unmount the Container

When done:

✅ GUI: Click **Dismount**
✅ CLI:

```bash
veracrypt -d /mnt/veracrypt1
```

---

## ✅ Example Session: CLI (quick)

```bash
# Create 2GB container
veracrypt --text --create /run/media/$USER/ExternalHDD/redteam_logs.hc
```

(interactive prompts)

```bash
# Mount it
sudo mkdir -p /mnt/veracrypt1
veracrypt --text --mount /run/media/$USER/ExternalHDD/redteam_logs.hc /mnt/veracrypt1
```

(password prompt)

```bash
# Use it!
ls /mnt/veracrypt1
cp logs here...

# Unmount
veracrypt -d /mnt/veracrypt1
```

---

## ✅ Tips for Red Team / OPSEC

⭐ Store your container on external HDD so it's air-gapped when not in use.
⭐ Use a *strong* password (long passphrase).
⭐ Use ext4 if you only need Linux.
⭐ Use exFAT if you want cross-platform (Linux/Windows).
⭐ You can resize containers later (but requires recreating them).
⭐ Keep backups securely if you can’t lose the data.

---

## ⚡ TL;DR Quick Command to Create

Interactive CLI:

```bash
veracrypt --text --create /run/media/$USER/ExternalHDD/redteam_logs.hc
```

---

If you want, I can **walk you through the exact interactive prompts** line by line, or show you how to **automate creation** with all parameters pre-filled!

Just let me know!
