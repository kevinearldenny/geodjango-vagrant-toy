#!/usr/bin/env bash

vagrant ssh -- -t '/vagrant/src/django/manage.py makemigrations --noinput'
vagrant ssh -- -t '/vagrant/src/django/manage.py migrate --noinput'