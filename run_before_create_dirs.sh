#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# bash completion
mkdir -p ~/.local/share/bash-completion/completions/

# gnupg
mkdir -p ~/.gnupg

# nvim
mkdir -p ~/.config/nvim/backups

# projects
mkdir -p ~/Projects/dlang
mkdir -p ~/Projects/vala
mkdir -p ~/Projects/vim

# ssh
mkdir -p ~/.ssh

# Ensure my custom bash setup is sourced
if ! grep -Fq "bash_steveno" ~/.bashrc
then
    echo 'source ~/.bash_steveno' >> ~/.bashrc
fi
