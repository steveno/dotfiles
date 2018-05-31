/home/steveno/.bash_aliases:
  file.managed:
    - source: salt://files/home/bash_aliases
    - template: jinja
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
