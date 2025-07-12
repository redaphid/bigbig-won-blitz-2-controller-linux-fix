#!/bin/bash

echo "Installing working xboxdrv service..."

# Stop any existing service
sudo systemctl stop xboxdrv.service 2>/dev/null
sudo systemctl disable xboxdrv.service 2>/dev/null

# Copy the new service file
sudo cp xboxdrv-working.service /etc/systemd/system/xboxdrv.service

# Reload systemd
sudo systemctl daemon-reload

# Enable and start the service
sudo systemctl enable xboxdrv.service
sudo systemctl start xboxdrv.service

# Check status
echo "Checking service status..."
sudo systemctl status xboxdrv.service

echo ""
echo "Service installed! Your controller should now work automatically on boot."