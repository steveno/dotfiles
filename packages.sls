{% for package in pillar.get('packages', {}) %}
{{ package }}_pkg:
  pkg.installed:
    - name: {{ package }}
{% endfor %}
