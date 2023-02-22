#!/bin/bash
########Variable decalred#####
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://templatemo.com/tm-zip-files-2020/templatemo_581_kind_heart_charity.zip"
ART_NAME="templatemo_581_kind_heart_charity"
TEMPDIR="/tmp/webfiles"

##Installing Dependencies
echo "#########################################################"
echo "Installing Packages."
echo "#########################################################"
sudo yum install $PACKAGE -y >/dev/null
echo

##Start & Enable Service

echo "########################################################"
echo "Start & Enable Httpd Service"
echo "########################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

###Creating Temp Directory

echo "########################################################"
echo "Starting Artifact Deployment"

echo "#######################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL >/dev/null

unzip $ART_NAME.zip >/dev/null

sudo cp -r $ART_NAME/* /var/www/html/

echo
##Bounce Service

echo "##################################"

echo "Restarting HTTPD Service"

sudo systemctl restart $SVC

echo

#Clean Up

echo "###############################################"
echo "Removing Temp Files"

echo "############################################"
rm -rf $TEMPDIR

echo
sudo systemctl status $SVC

ls /var/www/html


