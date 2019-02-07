/home/steveno/.bash_aliases:
  file.managed:
    - source: salt://files/home/bash_aliases
    - template: jinja
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True

/home/steveno/.bashrc:
  file.append:
    - text:
      - source ~/.git-prompt.sh
      - source ~/.workon.sh

/home/steveno/.workon.sh:
  file.managed:
    - source: salt://files/home/workon.sh
    - user: steveno
    - group: steveno
    - mode: 664
