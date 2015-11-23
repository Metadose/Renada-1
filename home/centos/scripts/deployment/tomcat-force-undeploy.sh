#!/bin/bash

# Force tomcat undeploy and clean.

sudo systemctl stop tomcat
cd $TOMCAT_WEBAPPS
sudo rm -Rd pmsys
sudo rm pmsys.war
sh ~/scripts/deployment/restart-tomcat.sh
echo "Forced undeploy finished."