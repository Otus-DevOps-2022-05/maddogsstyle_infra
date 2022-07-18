#!/bin/bash
sudo apt-get update
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
sudo dpkg --configure -a
sudo apt-get install -y mongodb
# systemctl start mongodb
# systemctl enable mongodb
# sudo mv -f /tmp/mongodb.conf /etc/mongodb.conf
# sudo systemctl restart mongodb
