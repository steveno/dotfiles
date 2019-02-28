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

/home/steveno/.goto.sh:
  file.managed:
    - source: https://raw.githubusercontent.com/iridakos/goto/master/goto.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True
    - skip_verify: True

/home/steveno/.goto:
  file.managed:
    - source: salt://files/home/goto
    - user: steveno
    - group: steveno
    - mode: 0664
    - makedirs: True
