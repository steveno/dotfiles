/home/steveno/.config/autostart/hexchat.desktop:
  pkg.latest:
    - name: hexchat
  file.managed:
    - source: salt://files/home/config/autostart/hexchat.desktop
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
