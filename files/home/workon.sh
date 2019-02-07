workon () {
    local PROJECT_PATH="/home/steveno/Projects"

    # D uses environments
    if [ -d "$PROJECT_PATH/dlang/$1" ]
    then
        cd "$PROJECT_PATH/dlang/$1";
        source $(~/dlang/install.sh dmd -a)
        return;
    fi

    # python uses environments
    if [ -d "$PROJECT_PATH/python/$1" ]
    then
        cd "$PROJECT_PATH/python/$1";

        if [ -f "env/bin/activate" ]
        then
            source env/bin/activate
        fi
        return;
    fi

    # Generic paths
    declare -a arr=("vala" "vim")
    for i in "${arr[@]}"
    do
        if [ -d "$PROJECT_PATH/$i/$1" ]
        then
            cd "$PROJECT_PATH/$i/$1";
            return;
        fi
    done

    # Special cases
    if [ $1 == "work" ]
    then
        cd "$PROJECT_PATH/work"
        return;
    fi

    if [ $1 == "dotfiles" ]
    then
        cd "$PROJECT_PATH/dotfiles"
        return;
    fi

    echo "$1 not found";
}
