#!/usr/bin/env bash

vagrant ssh -- -t 'flake8 --ignore E501 /vagrant/src/django/'