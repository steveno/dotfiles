# Setup prompt and such
if [[ $EUID -eq 0 ]]; then 
    # Root
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
else
    # User
    export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
    export LD_LIBRARY_PATH="/usr/local/lib"

    alias vi='nvim'
    alias vim='nvim'

    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w$(__git_ps1 " (%s)")\[\033[00m\]\$ '
fi

# Common aliases
alias mkdir='mkdir -p'
alias ls='ls --color'
alias check_tarsnap='sudo tarsnap --list-archives | sort'
