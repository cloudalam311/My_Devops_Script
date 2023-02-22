#!/bin/bash
app="httpd wget unzip"
##Installing Dependencies
echo "$app Installing Packages."
#echo "#########################################################"
sudo yum install $app -y 


