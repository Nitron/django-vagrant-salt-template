django:
    mode: vagrant
    path: /vagrant/{{ project_name }}/
    wsgi_module: {{ project_name }}.wsgi:application
    settings: {{ project_name }}.settings.local
    virtualenv: /home/vagrant/env
    user: vagrant
    group: vagrant
    log_path: /var/log/{{ project_name }}/
    run_dir: /var/run/{{ project_name }}/
