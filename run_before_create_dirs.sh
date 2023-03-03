#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

mkdir -p ~/Projects/dlang
mkdir -p ~/Projects/vala
mkdir -p ~/Projects/vim

# gnupg
mkdir -p ~/.gnupg
chown steveno:steveno ~/.gnupg
chmod 700 ~/.gnupg

# ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# nvim
mkdir -p ~/.config/nvim/backups
