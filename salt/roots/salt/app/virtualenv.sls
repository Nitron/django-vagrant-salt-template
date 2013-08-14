{% verbatim %}
{{ pillar['django']['virtualenv'] }}:
    virtualenv.managed:
        - no_site_packages: True
        - runas: {{ pillar['django']['user'] }}
        - requirements: salt://app/requirements/base.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv
            - pkg: libpq-dev
{% endverbatim %}