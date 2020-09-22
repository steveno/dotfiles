#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -o nounset
set -o errexit

NUM_SNAPSHOTS=$(/usr/bin/tarsnap --list-archives | wc -l)
OLDEST_SNAPSHOT=$(/usr/bin/tarsnap --list-archives | sort | head -n 1)

# Create new snapshot
/usr/bin/tarsnap -c \
    -f "$(uname -n)-$(date +%Y-%m-%d)" \
    /home/steveno/Documents \
    /home/steveno/Music \
    /home/steveno/Pictures \
    /home/steveno/Videos \
    /home/steveno/.config \
    /home/steveno/.gnupg \
    /home/steveno/.local \
    /home/steveno/.ssh

# If we have at least 5 snapshots delete the oldest
if [ $NUM_SNAPSHOTS -gt 4 ]
then
    /usr/bin/tarsnap -d -f $OLDEST_SNAPSHOT
fi
