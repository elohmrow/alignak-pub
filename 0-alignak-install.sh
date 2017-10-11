#!/bin/bash

# create an apt source with the content according to your Linux distribution.
echo "deb http://alignak-monitoring.github.io/repos/deb jessie main" | sudo tee /etc/apt/sources.list.d/alignak.list
sudo apt-get update

# Get and store the Alignak repos public key
wget -O- http://alignak-monitoring.github.io/repos/alignak_pub.key | sudo apt-key add -
apt-key list

# Install Alignak
sudo apt-get install alignak-all python-crypto
