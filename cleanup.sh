#!/usr/bin/env bash

set -euo pipefail

check_space() {
    df -h / | awk 'NR==2 {print $3 " used, " $4 " free (" $5 " full)"}'
}

echo "[+] Starting cleanup..."
echo "[*] Disk usage BEFORE cleanup:"
check_space

# 2. Remove old kernels
echo "[*] Removing old kernels..."
sudo dnf remove -y $(dnf repoquery --installonly --latest-limit=-2 -q) || true

# 3. Clean journal logs (keep 7 days)
if command -v journalctl &>/dev/null; then
    echo "[*] Cleaning systemd journal logs..."
    sudo journalctl --vacuum-time=7d
fi

# 4. Clear thumbnail cache
if [ -d "$HOME/.cache/thumbnails" ]; then
    echo "[*] Clearing thumbnail cache..."
    rm -rf "$HOME/.cache/thumbnails/*"
fi

# 5. Clear pip cache
if [ -d "$HOME/.cache/pip" ]; then
    echo "[*] Clearing pip cache..."
    rm -rf "$HOME/.cache/pip/*"
fi

# 6. Clear npm cache
if command -v npm &>/dev/null; then
    echo "[*] Cleaning npm cache..."
    npm cache clean --force || true
fi

# 7. Remove orphaned packages
echo "[*] Removing orphaned packages..."
sudo dnf autoremove -y

# 8. Remove temporary files
echo "[*] Clearing /tmp..."
sudo rm -rf /tmp/*

echo "[*] Disk usage AFTER cleanup:"
check_space

echo "[+] Cleanup finished."

