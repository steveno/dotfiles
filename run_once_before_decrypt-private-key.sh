#!/usr/bin/env bash

if [ ! -f "/home/steveno/.config/chezmoi/key.txt" ]; then
    mkdir -p "/home/steveno/.config/chezmoi"
    chezmoi age decrypt --output "/home/steveno/.config/chezmoi/key.txt" --passphrase "{{ .chezmoi.sourceDir }}/key.txt.age"
    chmod 600 "/home/steveno/.config/chezmoi/key.txt"
fi
