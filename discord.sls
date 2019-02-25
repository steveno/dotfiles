home/steveno/.config/autostart/discord.desktop:
  pkg.latest:
    - name: discord
  file.managed:
    - source: salt://files/home/config/autostart/discord.desktop
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
