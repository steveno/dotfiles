# Managed by salt
#!/bin/bash

if [ "$0" = "$BASH_SOURCE" ]
then
    echo "Script must be sourced!"
    exit 0;
fi

O_PWD=$(pwd)

rm -rf devsalt/
virtualenv devsalt
source devsalt/bin/activate
pip install pyzmq PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
pip install -e salt/
mkdir -p devsalt/etc/salt/pki/master
mkdir -p devsalt/etc/salt/pki/minion
cp ./salt/conf/master ./salt/conf/minion devsalt/etc/salt/

cd $O_PWD
