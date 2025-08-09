#!/bin/bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y usb-modeswitch usb-modeswitch-data ppp wvdial network-manager modemmanager usbutils kmod nano

# Ensure NetworkManager enabled
systemctl enable NetworkManager || true

# Create example wvdial.conf
cat > /etc/wvdial.conf <<'EOF' || true
[Dialer Defaults]
Init1 = ATZ
Stupid Mode = 1
Phone = *99#
Username = ''
Password = ''
EOF

echo "Postinstall customization done."
