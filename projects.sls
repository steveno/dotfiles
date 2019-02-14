{% for dir in pillar.get('project_directories', {}) %}
/home/steveno/Projects/{{ dir }}:
  file.directory:
    - name: /home/steveno/Projects/{{ dir }}
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755
{% endfor %}

{% for project in pillar.get('projects', {}) %}
{{ project.name }}_repository:
  git.cloned:
    - name: https://github.com/{{ project.owner }}/{{ project.name }}.git
    - user: steveno
    - target: /home/steveno/Projects/{{ project.lang }}/{{ project.name }}/
    - branch: {{ project.branch }}
{% endfor %}

/home/steveno/Projects/python/devsalt:
  virtualenv.managed:
    - system_site_packages: False
    - requirements: /home/steveno/Projects/python/salt/requirements/dev.txt
    - user: steveno
    - require:
      - git: salt_repository
