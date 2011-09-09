all:

install:
	install -p -m 0644 bash_profile $(HOME)/.bash_profile
	install -p -m 0644 bashrc $(HOME)/.bashrc
	install -p -m 0644 gitconfig $(HOME)/.gitconfig
	install -p -m 0644 gvimrc $(HOME)/.gvimrc
	install -p -m 0644 login.sql $(HOME)/
	install -p -m 0644 vimrc $(HOME)/.vimrc



