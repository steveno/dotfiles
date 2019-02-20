# Managed by salt
#!/bin/bash

if [ "$0" = "$BASH_SOURCE" ]
then
    echo "Script must be sourced!"
    exit 0;
fi

O_PWD=$(pwd)

cd /home/steveno/Projects/python/devsalt
source bin/activate
pip install --upgrade -e ../salt/

cd $O_PWD
