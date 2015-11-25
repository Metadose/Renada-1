#!/bin/bash

# Update the Renada repository and copy the scripts.
cd $RENADA_HOME
git pull
sudo rm -Rd /home/centos/scripts/
sudo mkdir -p /home/centos/scripts
sudo cp -r home/centos/scripts/* /home/centos/scripts
sudo chmod +x -R /home/centos/scripts/*