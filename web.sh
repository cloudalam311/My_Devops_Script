##Installing Dependencies
echo "#########################################################"
echo "Installing Packages."
echo "#########################################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

##Start & Enable Service

echo "########################################################"
echo "Start & Enable Httpd Service"
echo "########################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

###Creating Temp Directory

echo "########################################################"
echo "Starting Artifact Deployment"

echo "#######################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://templatemo.com/tm-zip-files-2020/templatemo_581_kind_heart_charity.zip > /dev/null

unzip templatemo_581_kind_heart_charity.zip > /dev/null

sudo cp -r templatemo_581_kind_heart_charity/* /var/www/html/

echo
##Bounce Service

echo "##################################"

echo "Restarting HTTPD Service"

sudo systemctl restart httpd

echo

#Clean Up

echo "###############################################"
echo "Removing Temp Files"

echo "############################################"
rm -rf /tmp/webfiles

echo
sudo systemctl status httpd

ls /var/www/html

