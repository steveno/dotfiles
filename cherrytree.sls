cherrytree_pkg:
  pkg.latest:
    - name: cherrytree

/home/steveno/.config/autostart/cherrytree.desktop:
  file.managed:
    - source: salt://files/home/config/autostart/cherrytree.desktop
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
