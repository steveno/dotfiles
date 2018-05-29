{% set packages = ['curl', 'neovim', 'keepassxc', 'git', 'build-essential', 'meson', 'valac',
                   'xiphos', 'sword-text-kjv'] %}

{% for package in packages%}
{{ package }}:
  pkg:
    - installed
{%endfor%}
