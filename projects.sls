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
    - name: https://github.com/steveno/{{ project.name }}.git
    - user: steveno
    - target: /home/steveno/Projects/{{ project.lang }}/{{ project.name }}/
    - branch: master
{% endfor %}
