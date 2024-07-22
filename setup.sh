#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# Install development related packages
sudo apt install build-essential cmake curl meson python3 \
    python3-pip

# Install vala specific packages
sudo apt install libgtk-3-dev libgee-0.8-dev libsqlite3-dev valac

# Install general purpose packages
sudo apt install calibre exfat-fuse fonts-ibm-plex \
    libreoffice mtp-tools simple-scan tarsnap texstudio vlc

