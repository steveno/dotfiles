/home/steveno/.ssh:
  file.directory:
    - name: /home/steveno/.ssh
    - user: steveno
    - group: steveno
    - mode: 700

/home/steveno/.ssh/id_rsa:
  file.managed:
    - name: /home/steveno/.ssh/id_rsa
    - user: steveno
    - group: steveno
    - mode: 600
    - replace: False

/home/steveno/.ssh/id_rsa.pub:
  file.managed:
    - name: /home/steveno/.ssh/id_rsa.pub
    - user: steveno
    - group: steveno
    - mode: 644
    - replace: False

/home/steveno/.ssh/known_hosts:
  file.managed:
    - name: /home/steveno/.ssh/known_hosts
    - user: steveno
    - group: steveno
    - mode: 644
    - replace: False
