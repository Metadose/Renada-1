#!/bin/bash

# Force undeploy.
sh ~/scripts/deployment/tomcat-force-undeploy.sh

# Stop services.
sh ~/scripts/deployment/stop-services.sh

# Undeploy.
sh ~/scripts/deployment/undeploy.sh

# Clear all logs.
sh ~/scripts/deployment/clear-logs.sh

# Remove the /pmsys directory.
sh ~/scripts/deployment/restart-tomcat.sh

# Deploy.
sh ~/scripts/deployment/deploy.sh