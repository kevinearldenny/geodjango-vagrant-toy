#!/usr/bin/env bash

vagrant ssh -- -t '/vagrant/src/django/manage.py runserver 0.0.0.0:8000'