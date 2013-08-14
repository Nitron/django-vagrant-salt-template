django:
    mode: vagrant
    path: /vagrant/{{ project_name }}/
    settings: {{ project_name }}.settings.local
    virtualenv: /home/vagrant/env
    user: vagrant
    group: vagrant
    log_path: /var/log/{{ project_name }}/
    run_dir: /var/run/{{ project_name }}/