#!/bin/sh
/usr/local/bin/tarsnap -c \
	-f "$(uname -n)-$(date +%Y-%m-%d)" \
	/home/steveno/Documents \
	/home/steveno/Music \
	/home/steveno/Pictures \
	/home/steveno/Videos \
	/home/steveno/.config \
	/home/steveno/.gnupg \
	/home/steveno/.local \
	/home/steveno/.ssh \
