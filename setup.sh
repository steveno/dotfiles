#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# tarsnap apt
cd /tmp
wget https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc
sudo apt-key add tarsnap-deb-packaging-key.asc
echo "deb http://pkg.tarsnap.com/deb/$(lsb_release -s -c) ./" | sudo tee -a /etc/apt/sources.list.d/tarsnap.list

# yubikey
sudo add-apt-repository ppa:yubico/stable

# Update apt sources
sudo apt-get update

# Install development related packages
sudo apt install build-essential cmake curl meson stow \
    python3 python3-pip

# Install general purpose packages
sudo apt install calibre exfat-fuse fonts-ibm-plex keepassxc \
    libreoffice mtp-tools simple-scan tarsnap texstudio vlc

# Install vala specific packages
sudo apt install libgtk-3-dev libgee-0.8-dev libsqlite3-dev valac

# Install yubikey packages
sudo apt install yubikey-manager yubioath-desktop yubikey-personalization-gui

# tarsnap config
sudo cp tarsnap/tarsnap.timer /etc/systemd/system/
sudo cp tarsnap/tarsnap.service /etc/systemd/system/
sudo cp tarsnap/tarsnap-backup.sh /root/
sudo cp tarsnap/tarsnap.conf /etc/

sudo systemctl enable --now tarsnap.timer
