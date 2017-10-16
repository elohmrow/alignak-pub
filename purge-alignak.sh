#!/bin/bash

# kill any alignak processes that are currently running:
ps aux  |  grep -i alignak  |  awk '{print $2}'  |  xargs sudo kill -9

cd /

# get rid of all the debian pkgs:
sudo apt-get -y autoremove alignak-all

# get rid of all leftover files: 
sudo find . -iname "*alignak*" 2>/dev/null -exec rm -rf {} \;

# get rid of the user:
sudo userdel -f alignak ; sudo id -u alignak

# get rid of the group:
sudo groupdel nagios ; grep -i "nagios" /etc/group
