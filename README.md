# Knockoff Xbox Controller Setup for Pop!_OS Linux

## Problem
Knockoff Xbox 360 controller (ID: 413d:2104) not recognized properly by Linux/Steam after system restart.

## Solution Steps

### 1. Initial Detection
- Controller detected via USB: `lsusb | grep 413d:2104`
- xpad module loads but doesn't create joystick device
- Controller incorrectly detected as keyboard device

### 2. Fix with xboxdrv
- xpad module interferes with xboxdrv, must be removed first
- Working command: `sudo xboxdrv --device-by-id 413d:2104 --type xbox360 --detach-kernel-driver`

### 3. Make Persistent
- Blacklist xpad: `echo "blacklist xpad" | sudo tee /etc/modprobe.d/blacklist-xpad.conf`
- Create systemd service to start xboxdrv on boot
- Service runs with `--mimic-xpad` flag for Steam compatibility

### 4. Steam Configuration
- Add user to input group: `sudo usermod -a -G input $USER`
- Create udev rule for controller permissions
- Enable "Xbox Configuration Support" in Steam settings
- May need to run Steam with: `SDL_GAMECONTROLLER_ALLOW_STEAM_VIRTUAL_GAMEPAD=0 steam`

## Quick Fix Scripts
- `./fix-controller.sh` - Try different xboxdrv modes
- `./setup-steam-controller.sh` - Complete Steam setup
- `./install-persistent.sh` - Install as system service

## Monitor Wake Issue
- `./fix-display-freeze.sh` - Fix frozen display after monitor wake
- See `prevent-monitor-issues.md` for prevention tips