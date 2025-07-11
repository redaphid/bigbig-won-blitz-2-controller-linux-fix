#!/bin/bash

echo "Fixing monitor setup..."

# First, detect connected monitors
echo "Detecting monitors..."
xrandr

# Try to reset the display configuration
echo -e "\nResetting display configuration..."

# Force detection of connected displays
xrandr --auto

# If you know your monitor names (like HDMI-1, DP-1, etc), uncomment and modify:
# xrandr --output HDMI-1 --auto --primary
# xrandr --output DP-1 --auto --right-of HDMI-1

# Alternative: restart display manager (choose your display manager)
echo -e "\nIf monitors are still not working, try:"
echo "1. Switch to TTY (Ctrl+Alt+F3), login, then run:"
echo "   sudo systemctl restart gdm     # For GNOME/Pop!_OS"
echo "   sudo systemctl restart lightdm # For other DEs"
echo ""
echo "2. Or try: sudo pkill -HUP gnome-shell"
echo ""
echo "3. Check your monitor arrangement in Settings > Displays"