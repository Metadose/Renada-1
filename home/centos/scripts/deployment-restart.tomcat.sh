#!/bin/bash
sudo systemctl stop tomcat
sudo mkdir $TOMCAT_WEBAPPS/pmsys
sudo systemctl start tomcat
echo "Restarted tomcat."