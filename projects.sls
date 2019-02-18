{% for dir in pillar.get('project_directories', {}) %}
/home/steveno/Projects/{{ dir }}:
  file.directory:
    - name: /home/steveno/Projects/{{ dir }}
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755
{% endfor %}

/home/steveno/Projects/python/start_salt.sh:
  file.managed:
    - source: salt://files/home/Projects/python/start_salt.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True

/home/steveno/Projects/python/create_virtualenv.sh:
  file.managed:
    - source: salt://files/home/Projects/python/create_virtualenv.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True

/home/steveno/Projects/python/update_devsalt.sh:
  file.managed:
    - source: salt://files/home/Projects/python/update_devsalt.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - makedirs: True
