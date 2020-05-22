#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -o nounset
set -o errexit

# Install development related packages
sudo apt install build-essential cmake curl git meson neovim stow tilix \
    tmux

# Install general purpose packages
sudo apt install calibre exfat-fuse fonts-ibm-plex keepassxc libreoffice \
    simple-scan texstudio vlc 

# Install vala specific packages
sudo apt install libgtk-3-dev libgee-0.8-dev libsqlite3-dev valac

# Install lisp specific packages
sudo apt install sbcl sbcl-source

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

# git
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh -sS

# goto
curl https://raw.githubusercontent.com/iridakos/goto/master/goto.sh -o ~/.goto.sh -sS

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Dotfiles
git clone https://github.com/steveno/dotfiles.git
cd ~/dotfiles
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

# Checkout my projects
cd ~/Projects
mkdir dlang vala vim
git clone https://github.com/steveno/anendektos.git dlang/
git clone https://github.com/steveno/balistica.git vala/
git clone https://github.com/steveno/libbalistica.git vala/
git clone https://github.com/steveno/polvora.git vala/
git clone https://github.com/steveno/mavi.git vim/

# lisp
mkdir lisp
curl https://beta.quicklisp.org/quicklisp.lisp -o ~/Projects/lisp/.quicklisp.lisp -sS
curl https://beta.quicklisp.org/release-key.txt -o /tmp/release-key.txt -sS
gpg --import /tmp/release-key.txt
curl https://beta.quicklisp.org/quicklisp.lisp.asc -o /tmp/quicklisp.lisp.asc -sS
gpg --verify /tmp/quicklisp.lisp.asc ~/Projects/lisp/.quicklisp.lisp 
if [ $? -ne 0 ]
then
    echo !!!!!!!!!!!!!
    echo quicklisp signature verification failed!
    echo !!!!!!!!!!!!!
fi
