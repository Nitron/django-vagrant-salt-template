{% verbatim %}
supervisor:
    pkg:
        - installed
    service.running:
        - watch:
            - file: /etc/supervisor/conf.d/*
            - file: /etc/supervisor/supervisord.conf
        - require:
            - pkg: supervisor
            - file: {{ pillar['django']['run_dir'] }}
            - file: {{ pillar['django']['log_path'] }}

gunicorn_app:
    file.managed:
        - name: /etc/supervisor/conf.d/app.conf
        - source: salt://app/supervisor/app.conf
        - template: jinja
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: supervisor
            - file: {{ pillar['django']['log_path'] }}
            - file: {{ pillar['django']['run_dir'] }}

/etc/supervisor/supervisord.conf:
    file.managed:
        - source: salt://app/supervisor/supervisord.conf
        - template: jinja
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: supervisor
            - file: {{ pillar['django']['run_dir'] }}
            - file: {{ pillar['django']['log_path'] }}
{% endverbatim %}
