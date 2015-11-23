#!/bin/bash
sudo systemctl start tomcat
echo "Started tomcat."

cd $PRAC_DEV
git pull
echo "Repository updated."

mvn tomcat7:deploy
sudo cp $PRAC_DEV/src/main/java/system.properties $TOMCAT_WEBAPPS/pmsys/WEB-INF/classes/system.properties
echo "Deployment done."