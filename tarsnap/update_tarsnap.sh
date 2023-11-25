#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

if ! test -f "$APT_CONFIG"; then
    cd /tmp
    wget https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc
    sudo apt-key add tarsnap-deb-packaging-key.asc
    echo "deb http://pkg.tarsnap.com/deb/$(lsb_release -s -c) ./" | sudo tee -a /etc/apt/sources.list.d/tarsnap.list
fi

# Update tarsnap script and configuration
sudo cp tarsnap/tarsnap.conf /etc/
sudo cp tarsnap/tarsnap-backup.sh /root/

# Update the tarsnap timer and service
sudo cp tarsnap/tarsnap.timer /etc/systemd/system/
sudo cp tarsnap/tarsnap.service /etc/systemd/system/

sudo systemctl enable --now tarsnap.timer
sudo systemctl daemon-reload

