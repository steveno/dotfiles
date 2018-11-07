{% for lang in ['c', 'd', 'python', 'vala', 'work', 'zig'] %}
/home/steveno/Projects/{{ lang }}:
  file.directory:
    - name: /home/steveno/Projects/{{ lang }}
    - makedirs: True
    - user: steveno
    - group: steveno
    - mode: 755
{% endfor %}

{% for project in pillar.get('projects', {}) %}
{{ project.name }}_repository:
  git.latest:
    - name: https://github.com/steveno/{{ project.name }}.git
    - user: steveno
    - update_head: False
    - target: /home/steveno/Projects/{{ project.lang }}/{{ project.name }}/
{% endfor %}
