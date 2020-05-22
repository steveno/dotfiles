#!/bin/bash

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

while getopts "u" opt
do
    case "$opt" in
        u) update_scripts
           ;;
    esac
done

if [[ -L "~/.config/goto" ]]
then
    # file is not a symlink, we've made changes?
    mv ~/.config/goto ~/dotfiles/goto/.config/goto
fi


cd ~/dotfiles
stow bash
stow d
stow git
stow goto
stow lisp
stow nvim
