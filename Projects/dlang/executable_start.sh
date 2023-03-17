#!/bin/bash

# Any copyright is dedicated to the Public Domain.
# https://creativecommons.org/publicdomain/zero/1.0/

if [ "$0" = "$BASH_SOURCE" ]
then
    echo "Script must be sourced!"
    exit 0;
fi

source $(~/dlang/install.sh dmd -a)
