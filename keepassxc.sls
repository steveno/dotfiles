/home/steveno/.config/autostart/keepassxc.desktop:
  pkg.installed:
    - name: keepassxc
  file.managed:
    - source: salt://files/home/config/autostart/keepassxc.desktop
    - user: steveno
    - group: steveno
    - mode: 664
