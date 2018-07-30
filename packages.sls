# General applications, etc.
{% set general = ['build-essential', 'calibre', 'cherrytree', 'curl', 'sqlitebrowser', 'texstudio', 'tmux', 'vlc'] %}
{% set xiphos = ['xiphos', 'sword-text-kjv'] %}

# Development packages
{% set vala_dev = ['libgee-0.8-dev', 'libsqlite3-dev', 'meson', 'valac'] %}
{% set salt_dev = ['libssl-dev', 'python-dev', 'python-m2crypto', 'python-pip', 'python-virtualenv', 'virtualenvwrapper'] %}

# Security
{% set security = ['fail2ban'] %}

# Install
{% for package in (general + xiphos + vala_dev + security + salt_dev) %}
{{ package }}:
  pkg:
    - installed
{% endfor %}
