#!/bin/bash
cd $PRAC_DEV &&
git pull &&
mvn clean tomcat7:undeploy
sudo systemctl stop tomcat