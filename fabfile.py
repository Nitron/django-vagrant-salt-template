from fabric.api import *
from fabtools.vagrant import vagrant, vagrant_settings
import os

PROJECT_PATH = '/vagrant/{{ project_name }}/'
VENV_PATH = '/home/vagrant/env'
MANAGE_BIN = os.path.join(PROJECT_PATH, 'manage.py')
SETTINGS = '{{ project_name }}.settings.local'


@task
def manage_py(command):
    """
    Runs a manage.py command on the server
    """
    with cd(PROJECT_PATH):
        run('{python} {manage} {command} --settings={settings}'.format(python=VENV_PATH + '/bin/python',
                                                manage=MANAGE_BIN,
                                                command=command,
                                                settings=SETTINGS))


@task
def syncdb():
    manage_py("syncdb --noinput --migrate")


@task
def migrate():
    manage_py("migrate")


@task
def createsuperuser():
    manage_py("createsuperuser")


@task
def gunicorn_hup():
    sudo("[ -e /var/run/{{ project_name }}/gunicorn.pid ] && kill -HUP $(cat /var/run/{{ project_name }}/gunicorn.pid)")


@task
def gunicorn_restart():
    """Restarts gunicorn completely (use when settings files have been changed)"""
    sudo("supervisorctl restart gunicorn_app")


@task
def watchdog():
    local('watchmedo shell-command --patterns="*.py" --recursive --command="fab vagrant gunicorn_hup" {{ project_name }}/')


@task
def provision():
    sudo('salt-call state.highstate')


@task
def vagrant_up():
    local('vagrant up')
    with vagrant_settings():
        execute(provision)
        execute(syncdb)
        execute(watchdog)
