#!/bin/bash

# Start services.
sh ~/scripts/deployment/start-services.sh

# Start the tomcat.
sudo systemctl restart tomcat

# Sleep for 60 seconds to wait.
sleep 60s

echo "Deployment is finished."