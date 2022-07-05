#!/bin/bash
apt-get update
sleep 50
apt-get install -y mongodb
systemctl start mongodb
systemctl enable mongodb
sudo mv -f /tmp/mongodb.conf /etc/mongodb.conf
sudo systemctl restart mongodb