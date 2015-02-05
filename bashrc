#
# Steven Oliver's bashrc
#

# Setup Linux desktop
function setup_linux {
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
    linux-gnu)
        setup_linux
        ;;
esac

# vim: set sw=4 sts=4 et tw=80 :
