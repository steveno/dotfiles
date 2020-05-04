keybase_repo:
  pkgrepo.managed:
    - name: deb https://prerelease.keybase.io/deb stable main
    - architectures: amd64
    - file: /etc/apt/sources.list.d/keybase.list
    - gpgkey: https://keybase.io/docs/server_security/code_signing_key.asc

keybase:
  pkg.installed
