#!/usr/bin/env bash

vagrant up
vagrant ssh -- -t '/vagrant/src/django/manage.py makemigrations --noinput'
vagrant ssh -- -t '/vagrant/src/django/manage.py migrate --noinput'
vagrant ssh -- -t '/vagrant/src/django/manage.py load_data'
vagrant ssh -- -t '/vagrant/src/django/manage.py runserver 0.0.0.0:8000'