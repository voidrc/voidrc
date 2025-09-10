## Step 1: Mount the 1TB SSD

- Prepare the 1TB SSD: You’ll need to format it with a filesystem like BTRFS.

```bash
sudo mkfs.btrfs -f /dev/sdX
```

- Mount the 1TB SSD:

```bash
sudo mkdir /mnt/home
sudo mount /dev/sdX /mnt/home
```

## Step 2: Move Data from /home (512GB SSD) to /mnt/home (1TB SSD)

- Move the data: You can use rsync to move the data from the old /home to the new SSD. This ensures permissions and data are properly copied.

```bash
sudo rsync -avh --progress /home/ /mnt/home/
```

This command will recursively copy everything from /home on the 512GB SSD to /mnt/home.

- Check that the data has been copied:

```bash
ls /mnt/home
```

## Step 3: Update the Mount Point for /home

```bash
sudo vim /etc/fstab
```

   Add or modify the line for /home to:

```bash
UUID=<UUID of 1TB SSD>  /home  btrfs  defaults  0  0
```
