# Source global definitions
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi 

# Setup prompt and such
if [[ $EUID -eq 0 ]]; then 
    # Root
    PS1="\[\e[031m\]\u\[\e[m\]@\\h:\\w\n$ "

    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
else
    # User
    PS1="\[\e[0;32m\]\u\[\e[m\]@\\h:\\w\$(__git_ps1)\n$ "
    export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
    export LD_LIBRARY_PATH="/usr/local/lib"
    source ~/.git-prompt.sh
fi

alias vi='nvim'
alias vim='nvim'

# Common aliases
alias mkdir='mkdir -p'
alias ls='ls --color'
