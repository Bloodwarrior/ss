#!/usr/bin/env bash
# play_doom.sh - script to install and run Freedoom using Chocolate Doom engine
# This script requires apt package manager (Debian/Ubuntu).
# It will automatically install both chocolate-doom and the freedoom game data
# if they are not already available on your system.

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

echo "Launching Freedoom using chocolate-doom..."
chocolate-doom -iwad /usr/share/games/freedoom/freedoom1.wad
