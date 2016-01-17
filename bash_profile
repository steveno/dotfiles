if [[ -f "$HOME/.bashrc" ]] ; then
    source $HOME/.bashrc
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
