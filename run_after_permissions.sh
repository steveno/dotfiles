#!/usr/bin/env bash

# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -o nounset
set -o errexit
set -o pipefail

# gnupg
chown steveno:steveno ~/.gnupg
chmod 700 ~/.gnupg

# ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
