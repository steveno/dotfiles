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
    if ! gpg --verify /tmp/quicklisp.lisp.asc ~/Projects/lisp/.quicklisp.lisp;
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
    sudo cp ~/Projects/dotfiles/tarsnap/tarsnap.timer /etc/systemd/system/
    sudo cp ~/Projects/dotfiles/tarsnap/tarsnap.service /etc/systemd/system/
}

while getopts "ut" opt
do
    case "$opt" in
        u) update_scripts
           ;;
        t) update_tarsnap
           ;;
        *) echo "Unrecognized argument"
           exit 1 ;;
    esac
done

if [[ -h ~/.config/goto && -L ~/.config/goto ]]
then
    # File is a symlink
    :
else
    # File is not a symlink, we've made changes?
    mv ~/.config/goto ~/Projects/dotfiles/goto/.config/goto
fi

sort -o ~/Projects/dotfiles/goto/.config/goto ~/Projects/dotfiles/goto/.config/goto

cd ~/Projects/dotfiles
stow -t /home/steveno/ alacritty
stow -t /home/steveno/ bash
stow -t /home/steveno/ borg
stow -t /home/steveno/ d
stow -t /home/steveno/ emacs
stow -t /home/steveno/ git
stow -t /home/steveno/ goto
stow -t /home/steveno/ lisp
stow -t /home/steveno/ nvim
stow -t /home/steveno/ tmux

# Reload tmux config
tmux source-file ~/.tmux.conf

# Update tarsnap script and configuration
sudo cp ~/Projects/dotfiles/tarsnap/tarsnap.conf /etc/
sudo cp ~/Projects/dotfiles/tarsnap/tarsnap-backup.sh /root/

systemctl --user daemon-reload
