git_installed:
  pkg.installed:
    - name: git

/home/steveno/.gitconfig:
  file.managed:
    - source: salt://files/home/gitconfig
    - user: steveno
    - group: steveno
    - mode: 664

/home/steveno/.git-prompt.sh:
  file.managed:
    - source: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    - user: steveno
    - group: steveno
    - mode: 664
    - skip_verify: true
