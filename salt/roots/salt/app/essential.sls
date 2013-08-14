{% verbatim %}
web-packages:
  pkg.installed:
    - names:
      - python-pip
      - python-virtualenv
      - python-dev
      - postgresql-server-dev-9.1
      - libpq-dev
      - libxml2-dev
      - libxslt1-dev
      - libjpeg62-dev
      - libcurl4-gnutls-dev

{{ pillar['django']['log_path'] }}:
    file.directory:
        - user: {{ pillar['django']['user'] }}
        - group: {{ pillar['django']['group'] }}
        - mode: 755
        - makedirs: True

{{ pillar['django']['run_dir'] }}:
  file.directory:
    - user: {{ pillar['django']['user'] }}
    - group: {{ pillar['django']['group'] }}
    - mode: 755
    - makedirs: True
{% endverbatim %}