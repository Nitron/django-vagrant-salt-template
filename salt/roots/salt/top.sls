{% verbatim %}
base:
    '*':
        - essential
        - ssh
        - rabbitmq
        - app.essential
        - app.virtualenv
        - app.postgresql
        - pgbouncer
        - app.supervisor
        - app.nginx
{% endverbatim %}