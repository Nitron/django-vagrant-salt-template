django:
    mode: production
    path: /home/{{ project_name }}/{{ project_name }}/{{ project_name }}
    wsgi_module: {{ project_name }}.wsgi:application
    settings: {{ project_name }}.settings.production
    virtualenv: /home/{{ project_name }}/env
    user: {{ project_name }}
    group: {{ project_name }}
    log_path: /home/{{ project_name }}/log/
    run_dir: /home/{{ project_name }}/run/
