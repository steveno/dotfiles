#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -o nounset
set -o errexit

# Install development related packages
sudo apt install build-essential cmake curl git meson neovim stow tilix

# Install general purpose packages
sudo apt install calibre exfat-fuse fonts-ibm-plex keepassxc libreoffice \
    simple-scan texstudio vlc 

# Install vala specific packages
sudo apt install libgtk-3-dev libgee-0.8-dev libsqlite3-dev valac

# gnupg
mkdir ~/.gnupg
chown steveno:steveno ~/.gnupg
chmod 700 ~/.gnupg

# neovim
mkdir -p ~/.config/nvim/backups
sudo update-alternatives --config editor

# ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Dotfiles
git clone https://github.com/steveno/dotfiles.git
cd dotfiles
stow bash
stow d
stow git
stow goto
stow lisp
stow nvim

# D
cd /tmp
curl https://dlang.org/install.sh -O -sS
chmod +x install.sh
./install.sh dmd -a

# Lisp
cd ~/dotfiles/lisp
curl https://beta.quicklisp.org/quicklisp.lisp -o .quicklisp.lisp -sS

# Checkout my projects
cd ~/Projects
mkdir vala vim
git clone https://github.com/steveno/anendektos.git dlang/
git clone https://github.com/steveno/balistica.git vala/
git clone https://github.com/steveno/libbalistica.git vala/
git clone https://github.com/steveno/polvora.git vala/
git clone https://github.com/steveno/mavi.git vim/
