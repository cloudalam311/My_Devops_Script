#!/bin/bash
sudo systemctl stop httpd
rm -rf /var/www/html/*
yum remove wget unzip httpd -y

echo "Package removed done."
