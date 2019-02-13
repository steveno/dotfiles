cherrytree_ppa:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/giuspen/ppa/ubuntu bionic main
    - architectures: amd64
    - file: /etc/apt/sources.list.d/cherrytree.list

cherrytree:
  pkg.installed

/home/steveno/.config/autostart/cherrytree.desktop:
  file.managed:
    - source: salt://files/home/config/autostart/cherrytree.desktop
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
  require:
    - pkg: cherrytree
