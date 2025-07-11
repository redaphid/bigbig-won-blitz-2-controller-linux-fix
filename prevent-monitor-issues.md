# Preventing Monitor Wake Issues in Pop!_OS

## Disable Display Power Management
Add to `/etc/X11/xorg.conf.d/10-monitor.conf`:
```
Section "ServerFlags"
    Option "BlankTime" "0"
    Option "StandbyTime" "0"
    Option "SuspendTime" "0"
    Option "OffTime" "0"
EndSection
```

## For NVIDIA Users
Edit `/etc/modprobe.d/nvidia-power-management.conf`:
```
options nvidia NVreg_PreserveVideoMemoryAllocations=1
options nvidia NVreg_TemporaryFilePath=/var/tmp
```

## GNOME Settings
```bash
# Disable automatic suspend
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# Keep monitors active
gsettings set org.gnome.desktop.session idle-delay 0
```

## Quick Fixes When It Happens
1. **Switch TTY**: `Ctrl+Alt+F3`, login, `sudo systemctl restart gdm`
2. **Reset displays**: Run `./fix-display-freeze.sh`
3. **Force detect**: `xrandr --auto`