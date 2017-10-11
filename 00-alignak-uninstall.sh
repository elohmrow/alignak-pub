#!/bin/bash

# remove alignak and supporting cast:
sudo apt-get -y autoremove alignak-all python-crypto

# remove the alignak user which is created when you install alignak:
sudo /usr/sbin/userdel -r alignak

# remove the nagios group which is created when you install alginak:
sudo groupdel nagios
# ^ that one we might need to be careful about ... if nagios is already in use for something else in the system

# if 'unknown user 'alignak' in statoverride file'-ish, then: 
#   sudo apt remove --purge alignak-all
#   sudo sed -i '/^alignak/d' /var/lib/dpkg/statoverride 
