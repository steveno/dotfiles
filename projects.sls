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

/home/steveno/Projects/dlang/start_d.sh:
  file.managed:
    - name: /home/steveno/Projects/dlang/start_d.sh
    - user: steveno
    - group: steveno
    - mode: 0764
    - contents:  |
        if [[ $_ == $0 ]]
        then
          echo "Script must sourced!"
          exit
        fi
        echo "Activating virtualenv"
        source $(~/dlang/install.sh dmd -a)
        cd anendektos
        clear
