---
title: Red-Logs
description: The project includes two scripts designed to log all terminal input and output, encrypt the logs, and securely store them on an external hard drive.
pubDate: 2025-07-11
heroImage: ../../assets/RedLogs.jpg
---
> The scripts are designed with the **FISH** shell in mind. If you intend to use these scripts with other shells, you will need to modify them accordingly.

## **Session Logger**
```fish
#!/usr/bin/env fish

# ------------------------
# Red Team Session Logger
# ------------------------

# Ask for client / engagement name
if test (count $argv) -eq 0
	echo -n "Enter client/engagement name: "
	read client
else
	set client $argv[1]
end

# Sanitize folder name
set client (string replace -a ' ' '_' $client)

# Directory to save logs
set logdir "$HOME/.redlogs/$client"
mkdir -p $logdir

# Timestamped filename
set ts (date "+%Y:%m:%d_%H:%M:%S")
set logfile "$logdir/session_$ts.log"

echo "---------------------------------------------"
echo "Starting Red Team logging session"
echo "Client/Engagement : $client"
echo "Log File          : $logfile"
echo "---------------------------------------------"

# Run the terminal logging session
script -q -f --command "fish" $logfile

echo "---------------------------------------------"
echo "Session ended. Log saved to $logfile"
echo "---------------------------------------------"
```

This **Fish shell** script is designed to log all terminal input and output in a structured and organized way.

**Key features:**
- **Engagement-based organization:** Prompts the user to enter a client or engagement name if none is provided as an argument. The name is sanitized (spaces replaced with underscores) to ensure safe folder naming.
- **Log management:** Creates a dedicated directory under `~/.redlogs/` for each engagement to store session logs in an organized manner.
- **Timestamped logs:** Generates uniquely named log files with precise timestamps to avoid overwrites and to facilitate easy auditing.
- **Seamless session recording:** Uses the `script` command to capture the entire terminal session, launching a new **Fish** shell instance for interactive use.
- **User feedback:** Prints clear start and end banners with engagement details and log file location, ensuring the user knows exactly where logs are stored.

**Usage:**
- Run the script directly with an optional client/engagement name:
```fish
./redlogs.fish ClientName
```
- Or without arguments to be prompted interactively.

---

## Log Transfer (VeraCrypt)
```fish
#!/usr/bin/env fish

# -----------------------------
# VeraCrypt Red Team Log Transfer
# -----------------------------

# CONFIG
set default_vc_container_name "redteam_logs.hc"
set vc_mount "/mnt/veracrypt1"
set local_logdir "$HOME/.redlogs"
set archived_logdir "$HOME/.redlogs/archived"

echo "==== VeraCrypt Logging Transfer ===="

# -----------------------------
# Prompt for external HDD mount point
echo -n "Enter path where your external USB is mounted: "
read USB_mount

sudo mkdir -p /mnt/tmp
sudo mount "$USB_mount" /mnt/tmp

# Build full path to the VeraCrypt container
set vc_container "$USB_mount/$default_vc_container_name"

# Check VeraCrypt container exists
if test ! -f $vc_container
    echo "ERROR: VeraCrypt container not found at $vc_container"
    exit 1
end

# Ensure archived folder exists
mkdir -p $archived_logdir

# Mount VeraCrypt volume
echo "Mounting VeraCrypt container..."
veracrypt --text --mount $vc_container $vc_mount
if test $status -ne 0
    echo "ERROR: Failed to mount VeraCrypt volume."
    exit 1
end

echo "Mounted VeraCrypt volume at $vc_mount"

# Process all client folders
for clientdir in $local_logdir/*
    if test -d $clientdir
        set client (basename $clientdir)
        echo "Processing client: $client"

        # Create client folder in VeraCrypt volume
        mkdir -p $vc_mount/$client
        mkdir -p $archived_logdir/$client

        # Copy all session logs
        for logfile in $clientdir/session_*.log
            if test -f $logfile
                echo "  -> Transferring $logfile"
                cp $logfile $vc_mount/$client/
                mv $logfile $archived_logdir/$client/
            end
        end
    end
end

echo "All logs transferred successfully."

# Dismount VeraCrypt volume
echo "Dismounting VeraCrypt volume..."
veracrypt -d $vc_mount

echo "Done!"
```

This **Fish shell** script is designed to securely transfer and archive red team session logs by copying them into an encrypted **VeraCrypt** container on an external drive. It helps ensure sensitive logs are safely stored while maintaining organized local archives.

**Key Features:**
- **External drive integration:** Prompts the user to specify the mount point of the external USB drive.
- **Secure container usage:** Verifies the presence of a specified VeraCrypt container file on the external drive before proceeding.
- **Mounting and dismounting:** Automates the mounting and dismounting of the VeraCrypt volume using command-line VeraCrypt in text mode.
- **Organized transfer:**
    - Iterates over all client engagement folders in the local log directory (`~/.redlogs`).
    - Creates matching client folders inside the mounted VeraCrypt volume to maintain organization.
    - Copies session logs (`session_*.log`) securely into the encrypted container.
    - Moves transferred logs into a local `archived` directory to avoid duplication in future transfers.
- **Error handling:** Includes sanity checks for directory paths and container existence, ensuring robust operation.

**Configuration Details:**
- **VeraCrypt container name:** Default is `redteam_logs.hc`, located on the external drive.
- **VeraCrypt mount point:** Default is `/mnt/veracrypt1`.
- **Local log directories:**
    - Active logs: `$HOME/.redlogs`
    - Archived logs: `$HOME/.redlogs/archived`

**Usage Example:**
```bash
./transfer_logs.fish
```
- You’ll be prompted:
```
Enter path where your external USB is mounted: /run/media/username/ExternalDrive
```

**Example Transfer Flow:**
1. Verify USB mount path and VeraCrypt container.
2. Mount encrypted volume.
3. Copy all session logs for each client into the corresponding folder in the container.
4. Move local copies to the archive folder.
5. Unmount the encrypted volume.

This script supports secure handling of sensitive red team artifacts by combining structured organization with strong encryption practices.

---
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

### **Result:**
Your USB stick will have:
- One FAT32 partition (~32 GB total).
- A 4 GB encrypted VeraCrypt container file (`redteam_logs.hc`) inside it.
- Portable, secure, cross-platform.