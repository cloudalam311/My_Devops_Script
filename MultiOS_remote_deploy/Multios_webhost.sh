#!/bin/bash
########Variable decalred#####
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL="https://templatemo.com/tm-zip-files-2020/templatemo_581_kind_heart_charity.zip"
ART_NAME="templatemo_581_kind_heart_charity"
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
        # set Variable for Centos

        PACKAGE="httpd wget unzip"
        SVC="httpd"

        echo "Running Setup on CentOS"

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

else
        #Set Variable for Ubuntu

        PACKAGE="apache2 wget unzip"
        SVC="apache2"

       echo "Running Setup on Ubuntu"

##Installing Dependencies
echo "#########################################################"
echo "Installing Packages."
echo "#########################################################"
sudo apt update
sudo apt install $PACKAGE -y >/dev/null
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

fi

