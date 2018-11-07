/home/steveno/.config/autostart/hexchat.desktop:
  pkg.installed:
    - name: hexchat
  file.managed:
    - source: salt://files/home/config/autostart/hexchat.desktop
    - user: steveno
    - group: steveno
    - mode: 664
