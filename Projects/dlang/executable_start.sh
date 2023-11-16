#!/bin/bash

# Any copyright is dedicated to the Public Domain.
# https://creativecommons.org/publicdomain/zero/1.0/

# shellcheck disable=SC2128
if [ "$0" = "${BASH_SOURCE[@]}" ]
then
    echo "Script must be sourced!"
    exit 0;
fi

# shellcheck source=/dev/null
source "$(~/dlang/install.sh dmd -a)"
