#!/bin/bash

echo "Fixing controller for Steam..."

# Kill any existing xboxdrv instances
echo "Stopping existing xboxdrv..."
sudo killall xboxdrv 2>/dev/null

# Start xboxdrv with Steam-compatible options
echo "Starting xboxdrv with Steam compatibility..."
sudo xboxdrv \
    --device-by-id 413d:2104 \
    --type xbox360 \
    --detach-kernel-driver \
    --mimic-xpad \
    --silent \
    --force-feedback \
    --deadzone 4000 \
    --trigger-as-button \
    --dpad-as-button

# Alternative command if the above doesn't work:
# sudo xboxdrv --device-by-id 413d:2104 --detach-kernel-driver --mimic-xpad --silent