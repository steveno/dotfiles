{% for dir in pillar.get('project_directories', {}) %}
/home/steveno/Projects/{{ dir }}:
  file.directory:
    - name: /home/steveno/Projects/{{ dir }}
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755
{% endfor %}

/home/steveno/Projects/python/devsalt:
  virtualenv.managed:
    - system_site_packages: False
    - requirements: /home/steveno/Projects/python/salt/requirements/dev.txt
    - user: steveno
