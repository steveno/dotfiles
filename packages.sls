{% set installed_packages = ['curl', 'neovim', 'keepassxc', 'git', 'build-essential', 'meson', 'valac',
                   'libgee-0.8-dev', 'tmux', 'xiphos', 'sword-text-kjv'] %}

{% set removed_packages = ['gnome-online-accounts'] %}

{% for package in installed_packages%}
{{ package }}:
  pkg:
    - installed
{%endfor%}

{% for package in removed_packages%}
{{ package }}:
  pkg:
    - removed
{%endfor%}
