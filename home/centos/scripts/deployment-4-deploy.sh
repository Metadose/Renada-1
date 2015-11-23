#!/bin/bash
sudo systemctl start tomcat
mvn tomcat7:deploy
sudo cp $PRAC_DEV/src/main/java/system.properties $TOMCAT_WEBAPPS/pmsys/WEB-INF/classes/system.properties