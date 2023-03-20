#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# Update tarsnap script and configuration
sudo cp tarsnap/tarsnap.conf /etc/
sudo cp tarsnap/tarsnap-backup.sh /root/

# Update the tarsnap timer and service
sudo cp tarsnap/tarsnap.timer /etc/systemd/system/
sudo cp tarsnap/tarsnap.service /etc/systemd/system/
sudo systemctl daemon-reload

