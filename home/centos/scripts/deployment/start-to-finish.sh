#!/bin/bash

sh ~/scripts/deployment/start.sh

sudo cp ~/system.properties $TOMCAT_WEBAPPS/pmsys/WEB-INF/classes/system.properties

sh ~/scripts/deployment-finish.sh