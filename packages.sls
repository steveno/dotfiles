# General applications, etc.
{% set general = ['build-essential', 'curl', 'git', 'keepassxc', 'meson', 'neovim', 'texstudio', 'tmux'] %}
{% set xiphos = ['xiphos', 'sword-text-kjv'] %}
# Development packages
{% set vala_dev = ['libgee-0.8-dev', 'valac']%}
{% set salt_dev = ['libssl-dev', 'python-dev', 'python-m2crypto', 'python-pip', 'python-virtualenv', 'virtualenvwrapper'] %}

{% set installed = (general, vala_dev, salt_dev, xiphos) %}

# Install
{% for package in installed %}
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
