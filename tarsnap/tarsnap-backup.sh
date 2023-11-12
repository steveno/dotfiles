#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# Store the current list of archives
archives=$(/usr/bin/tarsnap --list-archives)

# Find how many snapshots we have
# Arguments:
#   $1: M or W for monthly or weekly
num_snapshots() {
    # shellcheck disable=SC2126
    res=$(echo "$archives" | grep "$1" | wc -l)
}

# Find the oldest snapshot
# Arguments:
#   $1: M or W for monthly or weekly
oldest_snapshot() {
    res=$(echo "$archives" | grep "$1" | sort | head -n 1)
}

# Our main function
main() {
    # Determine, based on what day it is, whether
    # we should create a weekly snapshot or a
    # montly snapshot 
    if [ "$(date +"%d")" -gt 23 ]
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

    local res=0

    # Only keep 4 monthly snapshots
    num_snapshots "M"
    for i in $(seq $res -1 5);
    do
        oldest_snapshot "M"
	/usr/bin/tarsnap -d -f $res
    done

    # Only keep 5 weekly snapshots
    num_snapshots "W"
    for i in $(seq $res -1 6);
    do
        oldest_snapshot "W"
	/usr/bin/tarsnap -d -f $res
    done
}

main
