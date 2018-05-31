/home/steveno/Projects/clojure:
  file.directory:
    - name: /home/steveno/Projects/clojure
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755

/home/steveno/Projects/python:
  file.directory:
    - name: /home/steveno/Projects/python
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755

/home/steveno/Projects/rust:
  file.directory:
    - name: /home/steveno/Projects/rust
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755

/home/steveno/Projects/vala:
  file.directory:
    - name: /home/steveno/Projects/vala
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755

/home/steveno/Projects/vb:
  file.directory:
    - name: /home/steveno/Projects/vb
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755

/home/steveno/Projects/work:
  file.directory:
    - name: /home/steveno/Projects/work
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755

salt_repository:
  git.latest:
    - name: https://github.com/saltstack/salt.git
    - user: steveno
    - update_head: False
    - target: /home/steveno/Projects/python

balistica_repository:
  git.latest:
    - name: https://github.com/steveno/balistica.git
    - user: steveno
    - update_head: False
    - target: /home/steveno/Projects/vala

polvora_repository:
  git.latest:
    - name: https://github.com/steveno/polvora.git
    - user: steveno
    - update_head: False
    - target: /home/steveno/Projects/vala
