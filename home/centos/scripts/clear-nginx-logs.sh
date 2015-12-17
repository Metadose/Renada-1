#!/bin/bash

# Remove Logs.
sudo rm $NGINX_LOGS/access.log
sudo rm $NGINX_LOGS/error.log

# Create empty Log files.
sudo touch $NGINX_LOGS/access.log
sudo touch $NGINX_LOGS/error.log

# Change permission to be writable by all.
sudo chmod 666 -R $NGINX_LOGS/*.log
 
echo "Nginx logs cleared"