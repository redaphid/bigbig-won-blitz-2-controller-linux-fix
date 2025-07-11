#!/bin/bash

echo "Setting up controller for Steam..."

# 1. Stop any existing xboxdrv
sudo systemctl stop xboxdrv.service 2>/dev/null
sudo killall xboxdrv 2>/dev/null

# 2. Update the systemd service
echo "Installing Steam-compatible service..."
sudo cp xboxdrv-steam.service /etc/systemd/system/xboxdrv.service
sudo systemctl daemon-reload

# 3. Add user to input group (required for Steam)
echo "Adding user to input group..."
sudo usermod -a -G input $USER

# 4. Create udev rule for the controller
echo "Creating udev rule..."
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="413d", ATTRS{idProduct}=="2104", MODE="0666", GROUP="input"' | sudo tee /etc/udev/rules.d/99-xbox-controller.rules

# 5. Reload udev rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# 6. Start the service
echo "Starting xboxdrv service..."
sudo systemctl start xboxdrv.service

echo ""
echo "Setup complete! Please:"
echo "1. Log out and log back in (for group changes)"
echo "2. Start Steam"
echo "3. Go to Steam > Settings > Controller > General Controller Settings"
echo "4. Enable 'Xbox Configuration Support'"
echo "5. Your controller should now appear!"
echo ""
echo "If it still doesn't work, try running Steam from terminal with:"
echo "SDL_GAMECONTROLLER_ALLOW_STEAM_VIRTUAL_GAMEPAD=0 steam"