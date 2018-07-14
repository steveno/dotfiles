# General applications, etc.
{% set general = ['build-essential', 'cherrytree', 'curl', 'sqlitebrowser', 'texstudio', 'tmux', 'vlc'] %}
{% set xiphos = ['xiphos', 'sword-text-kjv'] %}

# Development packages
{% set vala_dev = ['libgee-0.8-dev', 'meson', 'valac'] %}
{% set salt_dev = ['libssl-dev', 'python-dev', 'python-m2crypto', 'python-pip', 'python-virtualenv', 'virtualenvwrapper'] %}

# Security
{% set security = ['fail2ban'] %}

# Install
{% for package in (general + xiphos + vala_dev + security + salt_dev) %}
{{ package }}:
  pkg:
    - installed
{% endfor %}

# Removed
{% set removed = ['gnome-online-accounts'] %}

{% for package in removed %}
{{ package }}:
  pkg:
    - removed
{% endfor %}
