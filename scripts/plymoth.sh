#!/bin/bash
set -ouex pipefail

echo "Force-setting Plymouth Theme to spinner..."

# Check if the config file exists
if [ -f /etc/plymouth/plymouthd.conf ]; then
    # Use 'sed' to find the line starting with 'Theme=' and change it to 'spinner'
    sed -i 's/^Theme=.*/Theme=spinner/' /etc/plymouth/plymouthd.conf
else
    # If file doesn't exist, create it
    mkdir -p /etc/plymouth
    echo "[Daemon]" > /etc/plymouth/plymouthd.conf
    echo "Theme=spinner" >> /etc/plymouth/plymouthd.conf
fi