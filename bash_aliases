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
    source ~/.git-prompt.sh
fi

# Common aliases
alias mkdir='mkdir -p'
alias ls='ls --color'
