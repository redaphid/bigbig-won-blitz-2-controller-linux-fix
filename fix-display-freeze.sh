#!/bin/bash

echo "Fixing display and input freeze..."

# Method 1: Reset display outputs
echo "Method 1: Resetting displays with xrandr..."
xrandr --auto
sleep 2

# Method 2: Restart compositor (for GNOME/Pop!_OS)
echo "Method 2: Restarting compositor..."
killall -3 gnome-shell 2>/dev/null || echo "GNOME Shell not running"

# Method 3: Reset GPU (safe method)
echo "Method 3: Resetting GPU state..."
if command -v nvidia-smi &> /dev/null; then
    echo "NVIDIA GPU detected, resetting..."
    sudo nvidia-smi -r
else
    echo "No NVIDIA GPU detected"
fi

# Method 4: Restart display manager (last resort)
echo -e "\nIf still frozen, press Ctrl+Alt+F3 to switch to TTY3, login, and run:"
echo "sudo systemctl restart gdm"
echo -e "\nThen press Ctrl+Alt+F1 to return to graphical session"

# Show current display configuration
echo -e "\nCurrent display configuration:"
xrandr | grep " connected"