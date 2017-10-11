#!/bin/bash

# check for updates and install alignak and supporting cast:
sudo apt-get update
sudo apt-get -y install git python2.7 python2.7-dev python-pip libffi-dev libssl-dev screen
sudo pip install --upgrade pip

mkdir repos
cd repos

# Alignak framework
git clone https://github.com/Alignak-monitoring/alignak
cd alignak/
# Install alignak and all its python dependencies
# -v will activate the verbose mode of pip
sudo pip install -v .

# create alignak user, nagios group, add alignak user to nagios group
cd repos
sudo ./alignak/dev/set_permissions.sh

sudo pip install alignak-backend

# get mongodb:
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

sudo pip install alignak-webui

# install some example checks: 
# Checks hosts thanks to NRPE Nagios active checks protocol
sudo pip install alignak-checks-nrpe

# Checks hosts thanks to old plain SNMP protocol
sudo pip install alignak-checks-snmp

# Checks hosts with "open source" Nagios plugins (eg. check_http, check_tcp, ...)
sudo pip install alignak-checks-monitoring

# Checks mysql database server
sudo pip install alignak-checks-mysql


# install some modules: backend, logs, web services, notifications:
sudo pip install alignak-module-backend
sudo pip install alignak-module-logs
sudo pip install alignak-module-ws
sudo pip install alignak-notifications
# Collect passive NSCA checks
sudo pip install alignak-module-nsca
# Write external commands (Nagios-like) to a local named file
sudo pip install alignak-module-external-commands
# Improve NRPE checks
sudo pip install alignak-module-nrpe-booster

