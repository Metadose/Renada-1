#!/bin/bash
sudo systemctl stop nginx
echo "Stopped nginx."

sudo systemctl stop tomcat
echo "Stopped tomcat."

sudo systemctl stop activemq
echo "Stopped activemq."