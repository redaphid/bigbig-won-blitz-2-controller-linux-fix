#!/bin/bash

echo "Starting xboxdrv without daemon mode..."

# Kill any existing instances
sudo killall xboxdrv 2>/dev/null

# Remove xpad if loaded
if lsmod | grep -q xpad; then
    echo "Removing xpad module..."
    sudo rmmod xpad
fi

# Start xboxdrv in foreground (no daemon)
echo "Starting xboxdrv..."
sudo xboxdrv \
    --device-by-id 413d:2104 \
    --type xbox360 \
    --detach-kernel-driver \
    --mimic-xpad \
    --silent \
    --force-feedback