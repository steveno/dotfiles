#
# Steven Oliver's bashrc
#

# Setup up my mac laptop
function setup_mac {
        # MacVim 
        export VIM_APP_DIR="/Applications/Custom/MacVim"

        # Path
        if [[ -n "${PATH/*$HOME\/Projects\/bin:*/}" ]] ; then
            export PATH="$HOME/Projects/bin:/usr/local/bin:/usr/local/sbin:$PATH"
        fi

        # Terminal Settings
        export CLICOLOR=1
        export EDITOR="mvim"
        PS1="\u@\h:\w $ "
}

# Setup Linux desktop
function setup_linux {
        # Source global definitions
        if [[ -f /etc/bashrc ]]; then
            . /etc/bashrc
        fi 
        
        source ~/.git-prompt.sh
        # Setup prompt and such
        if [[ $EUID -eq 0 ]]; then 
            PS1="\[\e[031m\]\u\[\e[m\]@\\h:\\w\n$ "

            alias rm='rm -i'
            alias cp='cp -i'
            alias mv='mv -i'
        else
            PS1="\[\e[0;32m\]\u\[\e[m\]@\\h:\\w\$(__git_ps1)\n$ "
            export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
            export LD_LIBRARY_PATH="/usr/local/lib"
        fi

        # Common aliases
        alias mkdir='mkdir -p'
        alias ls='ls --color'

        # Use vim as the pager
        if [[ -f /usr/bin/vimpager ]] ; then
            export PAGER=vimpager
            export MANPAGER=vimmanpager
        fi

        export PATH
}

# Pick an OS
case "${OSTYPE}" in
    darwin*)
        setup_mac
        ;;
    linux-gnu)
        setup_linux
        ;;
esac

# vim: set sw=4 sts=4 et tw=80 :

