#!/bin/bash
sudo systemctl stop tomcat
sudo mkdir $TOMCAT_WEBAPPS/pmsys
sudo systemctl start tomcat
sleep 45s 
sudo rm -dR $TOMCAT_WEBAPPS/pmsys
echo "Restarted tomcat."