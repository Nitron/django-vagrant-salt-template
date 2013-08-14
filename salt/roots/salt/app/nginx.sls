{% verbatim %}
include:
  - nginx

app-nginx-conf:
  file.managed:
    - name: /etc/nginx/sites-available/app.conf
    - source: salt://app/nginx.conf
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 755
    - require:
      - pkg: nginx

# Symlink and thus enable the virtual host
app-enable-nginx:
  file.symlink:
    - name: /etc/nginx/sites-enabled/app.conf
    - target: /etc/nginx/sites-available/app.conf
    - force: false
    - require:
      - file: app-nginx-conf
{% endverbatim %}