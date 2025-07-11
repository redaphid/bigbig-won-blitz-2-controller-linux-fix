#!/bin/bash

echo "Fixing knockoff Xbox controller..."

# Remove xpad module if loaded
if lsmod | grep -q xpad; then
    echo "Removing xpad module..."
    sudo rmmod xpad
fi

echo "Trying different xboxdrv configurations..."

# Try standard xbox360 mode
echo "1. Trying standard Xbox 360 mode..."
sudo xboxdrv --device-by-id 413d:2104 --type xbox360 --detach-kernel-driver

# If that fails, try wireless mode
if [ $? -ne 0 ]; then
    echo "2. Trying Xbox 360 wireless mode..."
    sudo xboxdrv --device-by-id 413d:2104 --type xbox360-wireless --detach-kernel-driver
fi

# If that fails, try mimic mode
if [ $? -ne 0 ]; then
    echo "3. Trying mimic xpad mode..."
    sudo xboxdrv --device-by-id 413d:2104 --mimic-xpad --detach-kernel-driver
fi