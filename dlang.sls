/home/steveno/dlang/install.sh:
  file.managed:
    - source: https://dlang.org/install.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True
    - skip_verify: True

pkg-curl:
  pkg.installed:
    - name: curl

install_d:
  cmd.run:
    - name: /home/steveno/dlang/install.sh dmd -a
    - cwd: /home/steveno/dlang
    - runas: steveno
    - require:
      - pkg: pkg-curl
    - onchanges:
      - file: /home/steveno/dlang/install.sh
