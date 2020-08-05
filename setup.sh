#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -o nounset
set -o errexit

mkdir ~/Projects

# tarsnap apt
cd /tmp
wget https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc
sudo apt-key add tarsnap-deb-packaging-key.asc
echo "deb http://pkg.tarsnap.com/deb/$(lsb_release -s -c) ./" | sudo tee -a /etc/apt/sources.list.d/tarsnap.list
sudo apt-get update

# Install development related packages
sudo apt install build-essential cmake curl git meson neovim stow \
    tmux python3 python3-pip

# Install general purpose packages
sudo apt install calibre exfat-fuse fonts-ibm-plex keepassxc libreoffice \
    mtp-tools simple-scan tarsnap texstudio vlc

# Install vala specific packages
sudo apt install libgtk-3-dev libgee-0.8-dev libsqlite3-dev valac

# Install go specific packages
sudo apt install gocryptfs scdoc

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

# tarsnap config
sudo cp ~/dotfiles/tarsnap/tarsnap.timer /etc/systemd/system/
sudo cp ~/dotfiles/tarsnap/tarsnap.service /etc/systemd/system/
sudo cp ~/dotfiles/tarsnap/tarsnap-backup.sh /root/
sudo cp ~/dotfiles/tarsnap/tarsnap.conf /etc/
sudo systemctl enable --now tarsnap.timer

# entr
curl https://github.com/eradman/entr/archive/4.6.tar.gz -L -sS -o /tmp/entr.tar.gz
tar xzf /tmp/entr.tar.gz -C /tmp
rm entr.tar.gz
cd /tmp/entr*
./configure
CFLAGS="-static" PREFIX=$HOME/.local make install

# git completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh -sS

# goto
curl https://raw.githubusercontent.com/iridakos/goto/master/goto.sh -o ~/.goto.sh -sS

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# bash
if ! grep -Fq "bash_steveno" ~/.bashrc
then
    echo 'source ~/.bash_steveno' >> ~/.bashrc
fi

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# alacritty
sudo apt install pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev
cd ~/Projects
mkdir rust && cd rust
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
cp target/release/alacritty /home/steveno/.local/bin/
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop

# Dotfiles
cd ~/
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
sudo apt install sbcl sbcl-source
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
