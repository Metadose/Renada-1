#!/bin/bash
sudo systemctl stop nginx
echo "Stopped nginx."

# sudo systemctl stop activemq
# echo "Stopped activemq."

sudo systemctl stop redis
echo "Stopped redis."