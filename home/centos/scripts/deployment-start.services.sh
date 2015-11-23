#!/bin/bash
sudo systemctl start redis
echo "Started redis."

sudo systemctl start nginx
echo "Started nginx."

sudo systemctl start activemq
echo "Started activemq."