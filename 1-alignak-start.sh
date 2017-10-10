#!/bin/bash

# start all the daemons:
sudo alignak-broker -c /etc/alignak/daemons/brokerd.ini
sudo alignak-scheduler -c /etc/alignak/daemons/schedulerd.ini
sudo alignak-poller -c /etc/alignak/daemons/pollerd.ini
sudo alignak-reactionner -c /etc/alignak/daemons/reactionnerd.ini
sudo alignak-receiver -c /etc/alignak/daemons/receiverd.ini
sudo alignak-arbiter -c /etc/alignak/daemons/arbiterd.ini -a /etc/alignak/alignak.cfg
