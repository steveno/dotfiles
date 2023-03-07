#!/usr/bin/env bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -o nounset
set -o errexit
set -o pipefail

# Store the current list of archives
archives=$(/usr/bin/tarsnap --list-archives)

# Find how many snapshots we have
# Arguments:
#   $1: M or W for monthly or weekly
num_snapshots() {
    ret_val=$(echo "$archives" | grep $1 | wc -l)
}

# Find the oldest snapshot
# Arguments:
#   $1: M or W for monthly or weekly
oldest_snapshot() {
    ret_val=$(echo "$archives" | grep $1 | sort | head -n 1)
}

# Our main function
main() {
    # Determine, based on what day it is, whether
    # we should create a weekly snapshot or
    # monthly snapshot
    if [ $(date +"%d") -gt 23 ]
    then
	/usr/bin/tarsnap -c \
            -f "$(uname -n)-$(date +%Y-%m-%d-%H)M" \
            /home/steveno/Documents \
            /home/steveno/Music \
            /home/steveno/Pictures \
            /home/steveno/Videos \
            /home/steveno/.config \
            /home/steveno/.gnupg \
            /home/steveno/.local \
            /home/steveno/.ssh
    else
	/usr/bin/tarsnap -c \
            -f "$(uname -n)-$(date +%Y-%m-%d-%H)W" \
            /home/steveno/Documents \
            /home/steveno/Music \
            /home/steveno/Pictures \
            /home/steveno/Videos \
            /home/steveno/.config \
            /home/steveno/.gnupg \
            /home/steveno/.local \
            /home/steveno/.ssh
    fi

    local ret_val=0

    # Only keep 4 monthly snapshot
    (num_snapshots "M")
    if [ $ret_val -gt 3 ]
    then
        oldest_snapshot "M"
	/usr/bin/tarsnap -d -f $ret_val
    fi

    # Only keep 5 weekly snapshot
    num_snapshots "W"
    if [ $ret_val -gt 4 ]
    then
        oldest_snapshot "W"
	/usr/bin/tarsnap -d -f $ret_val
    fi
}

main
