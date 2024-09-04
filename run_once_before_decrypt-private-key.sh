#!/usr/bin/env bash

# Any copyright is dedicated to the Public Domain.
# https://creativecommons.org/publicdomain/zero/1.0/

set -o nounset
set -o errexit
set -o pipefail

if [ ! -f "/home/steveno/.config/chezmoi/key.txt" ]; then
    mkdir -p "/home/steveno/.config/chezmoi"
    chezmoi age decrypt --output "/home/steveno/.config/chezmoi/key.txt" --passphrase "{{ .chezmoi.sourceDir }}/key.txt.age"
    chmod 600 "/home/steveno/.config/chezmoi/key.txt"
fi
