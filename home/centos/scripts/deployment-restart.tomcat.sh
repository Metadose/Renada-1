#!/bin/bash
sudo systemctl stop tomcat
sudo mkdir $TOMCAT_WEBAPPS/pmsys
sudo systemctl start tomcat
sudo rm -dR $TOMCAT_WEBAPPS/pmsys
echo "Restarted tomcat."