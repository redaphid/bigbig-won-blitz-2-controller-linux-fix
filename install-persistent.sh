#!/bin/bash

echo "Installing persistent Xbox controller fix..."

# Blacklist xpad module
echo "1. Blacklisting xpad module..."
echo "blacklist xpad" | sudo tee /etc/modprobe.d/blacklist-xpad.conf

# Copy systemd service
echo "2. Installing systemd service..."
sudo cp xboxdrv.service /etc/systemd/system/

# Enable and start the service
echo "3. Enabling xboxdrv service..."
sudo systemctl daemon-reload
sudo systemctl enable xboxdrv.service
sudo systemctl start xboxdrv.service

echo "4. Checking service status..."
sudo systemctl status xboxdrv.service

echo ""
echo "Installation complete! Your controller should now work automatically on boot."
echo "To check if it's running: sudo systemctl status xboxdrv"
echo "To view logs: sudo journalctl -u xboxdrv"