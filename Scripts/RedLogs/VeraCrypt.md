## Creating VeraCrypt Container

> **/dev/sdx** will be used as example USB. Change it to yours while following guide.

### **Wipe and Partition USB**
**a) Wipe partition table (optional but recommended)**
```bash
sudo wipefs -a /dev/sdx
```

**b) Create new GPT partition table**
```bash
sudo parted /dev/sdx -- mklabel gpt
```

**c) Create one big partition**
```bash
sudo parted /dev/sdx -- mkpart primary fat32 1MiB 100%
```

**d) Verify**
```bash
lsblk
```
You should see something like `/dev/sdx1`.

Format as FAT32 (good cross-platform choice):
```bash
sudo mkfs.vfat -F32 /dev/sdx1 -n USB_LOGS
```

Mount it:
```bash
sudo mount /dev/sdx1 /mnt
```
You can now write files to `/mnt`.

###  **Create the 4 GB VeraCrypt Container File**
> You need **veracrypt** installed.

**Interactive creation (recommended):**
```bash
veracrypt --text --create /mnt/redteam_logs.hc
```

You’ll be prompted for:
- Volume type → **1** (Standard)
- Size → **4G**
- Encryption → default AES is fine
- Hash → default SHA-512 is fine
- Filesystem → **FAT** (for widest compatibility)
- Password
- Leave **PIM** and **Key File Path** empty
- Smash the keyboard randomly
- And wait until VeraCrypt finishes
VeraCrypt will create `redteam_logs.hc` (4 GB) in `/mnt`.

When finished:
```bash
sudo umount /mnt
```

### **To Mount the Container Later**
Whenever you want to use it:
```bash
sudo mkdir -p /mnt/tmp
sudo mount /dev/sdx1 /mnt/tmp
sudo mkdir -p /mnt/veracrypt1
veracrypt --text --mount /mnt/tmp/redteam_logs.hc /mnt/veracrypt1
```
Enter your password when prompted.

To Dismount
```bash
veracrypt -d /mnt/veracrypt1
```
