#!/usr/bin/env bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -o nounset
set -o errexit
OPTIND=1

update_scripts() {
    # D
    curl https://dlang.org/install.sh -o ~/dlang/install.sh -sS
    chmod +x ~/dlang/install.sh

    # lisp
    curl https://beta.quicklisp.org/quicklisp.lisp -o ~/Projects/lisp/.quicklisp.lisp -sS
    curl https://beta.quicklisp.org/quicklisp.lisp.asc -o /tmp/quicklisp.lisp.asc -sS
    gpg --verify /tmp/quicklisp.lisp.asc ~/Projects/lisp/.quicklisp.lisp 
    if [ $? -ne 0 ]
    then
        echo !!!!!!!!!!!!!
        echo quicklisp signature verification failed!
        echo !!!!!!!!!!!!!
    fi

    # git
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh -sS

    # goto
    curl https://raw.githubusercontent.com/iridakos/goto/master/goto.sh -o ~/.goto.sh -sS
}

update_tarsnap_schedule() {
    sudo cp ~/dotfiles/tarsnap/tarsnap.timer /etc/systemd/system/
    sudo cp ~/dotfiles/tarsnap/tarsnap.service /etc/systemd/system/
    sudo systemctl daemon-reload
}

while getopts "ut" opt
do
    case "$opt" in
        u) update_scripts
           ;;
        t) update_tarsnap
           ;;
    esac
done

if [[ -h ~/.config/goto && -L ~/.config/goto ]]
then
    # File is a symlink
    :
else
    # File is not a symlink, we've made changes?
    mv ~/.config/goto ~/dotfiles/goto/.config/goto
fi

sort -o ~/dotfiles/goto/.config/goto ~/dotfiles/goto/.config/goto

cd ~/dotfiles
stow alacritty
stow bash
stow d
stow git
stow goto
stow lisp
stow nvim
stow tmux

# Reload tmux config
tmux source-file ~/.tmux.conf

# Update tarsnap script and configuration
sudo cp ~/dotfiles/tarsnap/tarsnap.conf /etc/
sudo cp ~/dotfiles/tarsnap/tarsnap-backup.sh /root/
