install_editor_alternative:
  alternatives.install:
    - name: editor
    - link: /usr/bin/editor
    - path: /usr/bin/nvim
    - priority: 100

ensure_editor_alternative:
  alternatives.auto:
    - name: editor
    - require:
      - alternatives: install_editor_alternative

/home/steveno/.config/nvim/backups:
  file.directory:
    - name: /home/steveno/.config/nvim/backups
    - user: steveno
    - group: steveno
    - mode: 700

/home/steveno/.config/nvim/init.vim:
  file.managed:
    - source: salt://files/home/config/nvim/init.vim
    - template: jinja
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True

{% if not salt['file.file_exists']('/home/steveno/.local/share/nvim/site/autoload/plug.vim') %}
/home/steveno/.local/share/nvim/site/autoload/plug.vim:
  file.managed:
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - user: steveno
    - group: steveno
    - mode: 664
    - makedirs: True
    - skip_verify: True
{% endif %}
