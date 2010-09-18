#
# Steven Oliver's bashrc
#

# Setup up my mac laptop
function setup_mac {
        # MacVim 
        export VIM_APP_DIR="/Applications/Custom/MacVim"

        # Path
        if [[ -n "${PATH/*$HOME\/Projects\/bin:*/}" ]] ; then
            export PATH="$HOME/Projects/bin:$PATH"
        fi

        #Terminal Settings
        export CLICOLOR=1

        setup_go
}

# Setup my non-existent linux desktop
function setup_linux {
        echo "NON-EXISTENT"
        
        # Use vim as the pager
        if [[ -f /usr/bin/vimpager ]] ; then
            export PAGER=vimpager
            export MANPAGER=vimmanpager
        fi
}

# Setup the Go language 
function setup_go {
        export GOROOT="$HOME/Projects/go"
        export GOBIN="$HOME/Projects/bin"

        case "${HOSTNAME}" in
            MOHIAM*)
                export GOOS="darwin"
                export GOARCH="386"
                ;;
            *)
                export GOOS="linux"
                export GOARCH=""
                ;;
        esac
}

# Setup up Falcon
function setup_fal {
        LIBDIR="/usr/local/lib"
        BINDIR="/usr/local/bin"

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
    linux*)
        setup_linux
        ;;
esac

# vim: set sw=4 sts=4 et tw=80 :

