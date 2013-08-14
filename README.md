django-vagrant-salt-template
============================

Django startproject template that provides a working Vagrant/Salt setup with:

* nginx
* gunicorn
* PostgreSQL
* Celery
* RabbitMQ
* pgbouncer

Requirements
============

* Vagrant
* Salty Vagrant
* Virtualbox or VMWare Fusion (and the Fusion provider for Vagrant)

Usage
=====

1. Install Django (globally in this case, but a virtualenv may be used):

```
$ sudo pip install django
```

2. Start the project from the template:

```
$ django-admin.py startproject --template=https://github.com/Nitron/django-vagrant-salt-template/archive/master.zip --extension=py,sls <project name>
$ cd <project name>
```

3. Install the requirements on your host machine:

```
$ sudo pip install -r requirements-vagrant.txt
```

4. Run! This command will start the Vagrant box, bootstrap Salt, provision the box, syncdb/migrate, and start the watchdog process:

```
$ fab vagrant_up
```

5. Open http://localhost:8000 in your browser (note that the port might be different if something is already bound to port 8000 when Vagrant starts. Look near the beginning of the output of "fab vagrant_up" to see where it mapped the port. It's probably 2201.)

6. See fabfile.py for more commands
