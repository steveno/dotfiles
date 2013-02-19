all:

install:
	# bash setup
	install -p -m 0644 bash_profile $(HOME)/.bash_profile
	install -p -m 0644 bashrc $(HOME)/.bashrc
	# git config
	install -p -m 0644 gitconfig $(HOME)/.gitconfig
	# vim setup
	install -p -m 0644 vimrc $(HOME)/.vimrc
	install -p -m 0644 gvimrc $(HOME)/.gvimrc
	# awesomewm setup
	install -p -m 0644 rc.lua $(HOME)/.config/awesome
	



