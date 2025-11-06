- Prepare the 1TB SSD: You’ll need to format it with a filesystem like BTRFS.
```bash
sudo mkfs.btrfs -f /dev/sdX
```

- Mount the 1TB SSD:
```bash
sudo mkdir -p /media/$USER
sudo chown $USER:$USER /media/$USER
sudo mount /dev/sdX /media/$USER
```

- Create folders
```bash
mkdir /media/$USER/Courses/ 
mkdir /media/$USER/Documents/ 
mkdir /media/$USER/Git/ 
mkdir /media/$USER/Music/ 
mkdir /media/$USER/Pictures/ 
mkdir /media/$USER/Videos/
```

- Move the data
```bash
sudo rsync -avh --progress ~/Courses/ /media/$USER/Courses/
sudo rsync -avh --progress ~/Documents/ /media/$USER/Documents/
sudo rsync -avh --progress ~/Git/ /media/$USER/Git/
sudo rsync -avh --progress ~/Music/ /media/$USER/Music/
sudo rsync -avh --progress ~/Pictures/ /media/$USER/Pictures/
sudo rsync -avh --progress ~/Videos/ /media/$USER/Videos/
```
> Check that the data has been copied:

- Link
```bash
ln -s /media/$USER/Courses ~/Courses
ln -s /media/$USER/Documents ~/Documents
ln -s /media/$USER/Git ~/Git
ln -s /media/$USER/Music ~/Music
ln -s /media/$USER/Pictures ~/Pictures
ln -s /media/$USER/Videos ~/Videos
```

- Modify `/etc/fstab`
```bash
sudo vim /etc/fstab

UUID=<UUID of storage>  /media/<youruser>  btrfs  deafults,noatime 0 2
```
> Add snapper rule just in-case