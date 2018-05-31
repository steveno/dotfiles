/home/steveno/.config/autostart/keepassxc.desktop:
  file.managed:
    - source: salt://files/home/config/autostart/keepassxc.desktop
    - user: steveno
    - group: steveno
    - mode: 664
