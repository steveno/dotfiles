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

# Setup linux desktop
function setup_linux {
        # Source global definitions
        if [[ -f /etc/bashrc ]]; then
            . /etc/bashrc
        fi 
        
        # Setup prompt and such
        if [[ $(id -u) -eq 0 ]]; then 
            PS1="\[\e[031m\]\u\[\e[m\]@\\h:\\w $ "
            PATH=$PATH:$HOME/bin
    
            alias rm='rm -i'
            alias cp='cp -i'
            alias mv='mv -i'
        else
            PATH=$PATH:$HOME/.local/bin/:$HOME/BIN
            PS1="\[\e[0;32m\]\u\[\e[m\]@\\h:\\w $ "
        fi

        # Common aliases
        alias mkdir='mkdir -p'
        
        # Always use color
        alias ls='ls --color'
        
        # Use vim as the pager
        if [[ -f /usr/bin/vimpager ]] ; then
            export PAGER=vimpager
            export MANPAGER=vimmanpager
        fi
                       
        export PATH
        export XDG_CONFIG_HOME="$HOME/.config"
}

# Setup up Falcon
function setup_fal {
        LIBDIR="/tmp/usr/local/lib"
        BINDIR="/tmp/usr/local/bin"
        
        export LD_LIBRARY_PATH="$1/$LIBDIR:$LD_LIBRARY_PATH"
        export FALCON_LOAD_PATH=".;$1/$LIBDIR/falcon"
        export PATH="$1/$BINDIR:$PATH"
        export DYLD_LIBRARY_PATH="$LD_LIBRARY_PATH"
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

