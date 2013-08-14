{% verbatim %}
pgbouncer:
    pkg:
        - installed
    service:
        - running
        - require:
            - file: /etc/pgbouncer/pgbouncer.ini
            - file: /etc/pgbouncer/userlist.txt
            - file: /etc/default/pgbouncer
        - watch:
            - file: /etc/pgbouncer/pgbouncer.ini
            - file: /etc/pgbouncer/userlist.txt
            - file: /etc/default/pgbouncer

/etc/pgbouncer/pgbouncer.ini:
    file.managed:
        - source: salt://pgbouncer/pgbouncer.ini
        - user: postgres
        - group: postgres
        - mode: 640
        - require:
            - pkg: pgbouncer

/etc/pgbouncer/userlist.txt:
    file.managed:
        - source: salt://pgbouncer/userlist.txt
        - template: jinja
        - user: postgres
        - group: postgres
        - mode: 640
        - require:
            - pkg: pgbouncer

/etc/default/pgbouncer:
    file.managed:
        - source: salt://pgbouncer/pgbouncer-default
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: pgbouncer
{% endverbatim %}