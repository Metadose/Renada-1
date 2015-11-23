#!/bin/bash
sudo systemctl start nginx
echo "Started nginx."

# sudo systemctl start tomcat
# echo "STARTED: tomcat"

sudo systemctl start activemq
echo "Started activemq."