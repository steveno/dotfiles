# Managed by salt
#!/bin/bash

if [ "$0" = "$BASH_SOURCE" ]
then
    echo "Script must be sourced!"
    exit 0;
fi

function start_salt {
    ulimit -n 2047
    cd /home/steveno/Projects/python/devsalt
    salt-master -c ./etc/salt -d
    salt-minion -c ./etc/salt -d
    sleep 3
    salt -c ./etc/salt '*' test.ping
}

function kill_salt {
    deactivate
    pkill -f ./etc/salt
}

O_PWD=$(pwd)

kill_salt
cd /home/steveno/Projects/python/devsalt
virtualenv --clear .
source bin/activate
pip install -e ../salt/
start_salt

cd $O_PWD
