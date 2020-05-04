/home/steveno/dlang/install.sh:
  file.managed:
    - source: https://dlang.org/install.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True
    - skip_verify: True

curl:
  pkg.installed

install_d:
  cmd.run:
    - name: /home/steveno/dlang/install.sh dmd -a
    - cwd: /home/steveno/dlang
    - runas: steveno
    - require:
      - pkg: curl
    - onchanges:
      - file: /home/steveno/dlang/install.sh

/home/steveno/Projects/dlang/start_d.sh:
  file.managed:
    - source: salt://files/home/Projects/dlang/start_d.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True
