#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# bash completion
mkdir -p ~/.local/share/bash-completion/completions/

# gnupg
mkdir -p ~/.gnupg

# ssh
mkdir -p ~/.ssh

