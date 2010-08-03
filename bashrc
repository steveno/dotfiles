# Setup up my mac laptop
function setup_mac {
        # MacVim 
        export VIM_APP_DIR="/Applications/Custom/MacVim"

        # Path
        if [[ -n "${PATH/*$HOME\/Projects\/bin:*/}" ]] ; then
            export PATH="$HOME/Projects/bin:$PATH"
        fi

        setup_go
}

# Setup my non-existent linux desktop
function setup_linux {
        echo "NON-EXISTENT"
}

# Setup the Go language 
function setup_go {
        export GOROOT="$HOME/Projects/go"
        export GOBIN="$HOME/Projects/bin"

        case "${OSTYPE}" in
            darwin*)
                export GOOS="darwin"
                export GOARCH="386"
                ;;
            linux*)
                export GOOS="linux"
                export GOARCH=""
                ;;
        esac
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

