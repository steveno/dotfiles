# Managed by salt
#!/bin/bash

ulimit -n 2047
cd /home/steveno/Projects/python/devsalt
salt-master -c ./etc/salt -d
salt-minion -c ./etc/salt -d
sleep 3
salt -c ./etc/salt '*' test.ping
source bin/activate
cd /home/steveno/Projects/python/salt
