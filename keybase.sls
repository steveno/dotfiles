keybase_repo:
  pkgrepo.managed:
    - name: deb http://prerelease.keybase.io/deb stable main
    - architectures: amd64
    - file: /etc/apt/sources.list.d/keybase.list

keybase:
  pkg.installed
