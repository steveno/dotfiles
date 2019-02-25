# Managed by salt
#!/bin/bash

O_PWD=$(pwd)

cd /home/steveno/Projects/python/salt
git fetch upstream
git co develop
git merge --ff-only upstream/develop
git push origin develop

cd $O_PWD
