#!/usr/bin/env bash

vagrant ssh -c 'flake8 --ignore E501 /vagrant/src/django/'