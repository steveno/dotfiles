/home/steveno/.gitconfig:
  file.managed:
    - source: salt://files/git/gitconfig
    - user: steveno
    - group: steveno
    - mode: 664

/home/steveno/.git-prompt.sh:
  file.managed:
    - source: salt://files/git/git-prompt.sh
    - user: steveno
    - group: steveno
    - mode: 664
