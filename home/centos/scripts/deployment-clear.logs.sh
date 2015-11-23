#!/bin/bash
sudo rm -rf $CMP_LOGS
sudo rm -rf $TOMCAT_LOGS
sudo mkdir $CMP_LOGS
sudo mkdir $TOMCAT_LOGS
sudo chmod 777 -R $CMP_LOGS
sudo chmod 777 -R $TOMCAT_LOGS