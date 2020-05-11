#!/bin/bash

if [ "$0" = "$BASH_SOURCE" ]
then
    echo "Script must be sourced!"
    exit 0;
fi

source $(~/dlang/install.sh dmd -a)
