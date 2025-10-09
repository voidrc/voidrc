#!/usr/bin/env bash
# VeraCrypt Red Team Log Transfer (bash)
set -euo pipefail

# CONFIG
default_vc_container_name="redteam_logs.hc"
vc_mount="/mnt/veracrypt1"
local_logdir="$HOME/.redlogs"
archived_logdir="$HOME/.redlogs/archived"

echo "==== VeraCrypt Logging Transfer ===="

# Prompt for external USB device path or mount point
read -r -p "Enter path to your external USB (device node like /dev/sdX or existing mount point): " usb_path

# Temporary mountpoint if user provided a device node
tmp_mount="/mnt/tmp"
usb_mount="$usb_path"

# If the user gave a device node (starts with /dev/), mount it to /mnt/tmp
if [[ "$usb_path" == /dev/* ]]; then
  echo "Detected device node. Mounting $usb_path -> $tmp_mount (requires sudo)..."
  sudo mkdir -p -- "$tmp_mount"
  sudo mount "$usb_path" "$tmp_mount"
  usb_mount="$tmp_mount"
else
  # If it is a directory, ensure it exists
  if [[ ! -d "$usb_path" ]]; then
    echo "ERROR: path '$usb_path' does not exist or is not a directory."
    exit 1
  fi
fi

# Build full path to the VeraCrypt container
vc_container="$usb_mount/$default_vc_container_name"

# Check VeraCrypt container exists
if [[ ! -f "$vc_container" ]]; then
  echo "ERROR: VeraCrypt container not found at: $vc_container"
  # If we mounted a device earlier, unmount it before exiting
  if [[ "$usb_path" == /dev/* ]]; then
    echo "Unmounting temporary mount $tmp_mount..."
    sudo umount "$tmp_mount" || true
  fi
  exit 1
fi

# Ensure archived folder exists
mkdir -p -- "$archived_logdir"

# Ensure veracrypt mountpoint exists
sudo mkdir -p -- "$vc_mount"

# function to clean up on exit
_cleanup() {
  echo "Cleaning up..."
  if mountpoint -q "$vc_mount"; then
    echo "Dismounting VeraCrypt volume at $vc_mount..."
    veracrypt -d "$vc_mount" || true
  fi
  # if we mounted the device to /mnt/tmp earlier, unmount it
  if [[ "$usb_path" == /dev/* ]] && mountpoint -q "$tmp_mount"; then
    echo "Unmounting temporary mount $tmp_mount..."
    sudo umount "$tmp_mount" || true
  fi
}
trap _cleanup EXIT

# Mount VeraCrypt volume (text mode)
echo "Mounting VeraCrypt container..."
if ! veracrypt --text --mount "$vc_container" "$vc_mount"; then
  echo "ERROR: Failed to mount VeraCrypt container."
  exit 1
fi

echo "Mounted VeraCrypt volume at $vc_mount"

# Transfer logs
shopt -s nullglob
for clientdir in "$local_logdir"/*; do
  if [[ -d "$clientdir" ]]; then
    client=$(basename -- "$clientdir")
    echo "Processing client: $client"

    mkdir -p -- "$vc_mount/$client"
    mkdir -p -- "$archived_logdir/$client"

    # Move/copy all session logs matching session_*.log
    for logfile in "$clientdir"/session_*.log; do
      if [[ -f "$logfile" ]]; then
        echo "  -> Transferring $(basename -- "$logfile")"
        cp -- "$logfile" "$vc_mount/$client/" || {
          echo "Warning: failed to copy $logfile to $vc_mount/$client/"
        }
        mv -- "$logfile" "$archived_logdir/$client/" || {
          echo "Warning: failed to move $logfile to $archived_logdir/$client/"
        }
      fi
    done
  fi
done
shopt -u nullglob

echo "All logs transferred (if any existed)."

# Dismount happens in _cleanup via trap
echo "Done!"
