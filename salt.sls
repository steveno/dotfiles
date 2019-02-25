{% for script in pillar.get('salt_scripts', {}) %}
/home/steveno/Projects/python/{{ script }}.sh:
  file.managed:
    - source: salt://files/home/Projects/python/{{ script }}.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True
{% endfor %}
