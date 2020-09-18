#!/bin/bash


# Need to fix locale so that Postgres creates databases in UTF-8
cp -p /vagrant_data/etc-bash.bashrc /etc/bash.bashrc
locale-gen en_GB.UTF-8
dpkg-reconfigure locales
export LC_ALL=en_US.UTF-8

# Install essential packages from Apt
apt-get update

# Install Python
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3 python3-pip -y
sudo ln -s /usr/bin/python3.6 /usr/local/bin/python3

# Install PostgreSQL
apt-get install postgresql libpq-dev postgresql-client postgresql-client-common -y

# Install GDAL
sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt-get update
apt-get install gdal-bin libgdal-dev locales binutils python3-gdal -y
apt-get install python3-psycopg2 -y

# Install PostGIS
#apt-get install postgresql-10-postgis-2.4 -y
apt-get install postgis -y
apt-get install postgresql-10-postgis-2.4-scripts -y


export CPLUS_INCLUDE_PATH='/usr/include/gdal'
export C_INCLUDE_PATH='/usr/include/gdal'


# Install Django requirements
cd /vagrant/src/django
pip3 install -r requirements.txt

# Set up Postgres DB
DATABASE_USERNAME="admin"
DATABASE_PASSWORD="fakepassword"
DATABASE_NAME="toy"

sudo -u postgres psql -c "create user $DATABASE_USERNAME with password '$DATABASE_PASSWORD';"
sudo -u postgres psql -c "alter user $DATABASE_USERNAME createdb;"
sudo -u postgres psql -c "create database $DATABASE_NAME;"
sudo -u postgres psql -c "grant all privileges on database $DATABASE_NAME to $DATABASE_USERNAME;"
sudo -u postgres psql -c "ALTER ROLE $DATABASE_USERNAME SUPERUSER;"
sudo -u postgres psql -c "create extension postgis"

