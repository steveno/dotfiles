# General applications, etc.
{% set general = ['calibre', 'cherrytree', 'texstudio', 'tmux', 'vlc', 'xiphos', 'sword-text-kjv'] %}

# Development packages
{% set general_dev = ['build-essential', 'cmake', 'curl', 'hexchat', 'sqlitebrowser'] %}
{% set vala_dev = ['libgee-0.8-dev', 'libsqlite3-dev', 'meson', 'valac'] %}
{% set salt_dev = ['libssl-dev', 'python-dev', 'python-m2crypto', 'python-pip', 'python-virtualenv', 'virtualenvwrapper'] %}

# Security
{% set security = ['fail2ban'] %}

# Install
{% for package in (general + general_dev + vala_dev + salt_dev + security) %}
{{ package }}:
  pkg:
    - installed
{% endfor %}
