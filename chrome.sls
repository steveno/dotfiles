chrome_repo:
  pkgrepo.managed:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - dist: stable
    - file: /etc/apt/sources.list.d/google-chrome.list
    - architectures: amd64
    - gpgcheck: 1

google-chrome-stable:
  pkg.installed
