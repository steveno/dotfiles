{% set packages = ['curl', 'neovim', 'keepassxc', 'git', 'build-essential', 'meson', 'valac',
                   'libgee-0.8-dev', 'xiphos', 'sword-text-kjv'] %}

{% for package in packages%}
{{ package }}:
  pkg:
    - installed
{%endfor%}
