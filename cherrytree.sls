cherrytree_ppa:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/giuspen/ppa/ubuntu bionic main
    - architectures: amd64
    - file: /etc/apt/sources.list.d/cherrytree.list

cherrytree_pkg:
  pkg.latest:
    - name: cherrytree
    - require:
      - pkgrepo: cherrytree_ppa

/home/steveno/.config/autostart/cherrytree.desktop:
  file.managed:
    - source: salt://files/home/config/autostart/cherrytree.desktop
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True

/home/steveno/.config/cherrytree/config.cfg:
  file.managed:
    - source: salt://files/home/config/cherrytree/config.cfg
    - template: jinja
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
