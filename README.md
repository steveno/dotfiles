# Steven Oliver's dotfiles
These are my dotfiles which I manage with [chezmoi](https://www.chezmoi.io/). That
explains all of the funny file names. This repository replaces my previous one. I
went full nuclear and completely deleted my old dotfiles repository and started
from scratch.

# Contents
## Config files
It's mostly what you would expect. A lot of bash config, tmux, and git. Inside
the [dot_config](https://github.com/steveno/dotfiles/tree/main/dot_config) folder
I have my neovim setup, chezmoi's config file, and my goto config.

In the [tarsnap folder](https://github.com/steveno/dotfiles/tree/main/tarsnap) I
keep my systemd setup and backup script for [tarsnap](https://www.tarsnap.com/).

## Scripts
I currently have two scripts. One creates directories and the other helps me
maintain permissions on certian files.

# License
The actual code is licensed under a 3-clause BSD license. Configuration files that
contain no code are public domain to the extent possible. If you do not know which
is which, all files under a BSD license have a header at the top.
