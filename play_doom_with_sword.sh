#!/usr/bin/env bash
# play_doom_with_sword.sh - install Freedoom and run with a sword mod
# This script requires apt package manager (Debian/Ubuntu).
# It will automatically install chocolate-doom, freedoom, and download a
# community sword mod if they are not available.

set -e

# check if chocolate-doom is installed
if ! command -v chocolate-doom >/dev/null 2>&1; then
    echo "Installing chocolate-doom..."
    sudo apt-get update
    sudo apt-get install -y chocolate-doom
fi

# check if freedoom wad is installed
if ! dpkg -l | grep -q freedoom ; then
    echo "Installing freedoom..."
    sudo apt-get install -y freedoom
fi

# ensure wget is available for downloading mods
if ! command -v wget >/dev/null 2>&1; then
    echo "Installing wget..."
    sudo apt-get update
    sudo apt-get install -y wget
fi

# directory to store mods
MOD_DIR="$HOME/.local/share/doom"
mkdir -p "$MOD_DIR"
SWORD_WAD="$MOD_DIR/sword.wad"
SWORD_WAD_URL="https://example.com/sword.wad"  # placeholder URL for sword mod

# download sword mod if not present
if [ ! -f "$SWORD_WAD" ]; then
    echo "Downloading sword mod..."
    wget -O "$SWORD_WAD" "$SWORD_WAD_URL"
fi

echo "Launching Freedoom with sword mod using chocolate-doom..."
chocolate-doom -iwad /usr/share/games/freedoom/freedoom1.wad -file "$SWORD_WAD"
