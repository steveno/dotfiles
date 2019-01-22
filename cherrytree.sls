/home/steveno/.config/autostart/cherrytree.desktop:
  pkg.installed:
    - name: cherrytree
  file.managed:
    - source: salt://files/home/config/autostart/cherrytree.desktop
    - user: steveno
    - group: steveno
    - mode: 664
