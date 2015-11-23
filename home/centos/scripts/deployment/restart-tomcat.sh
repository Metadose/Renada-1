#!/bin/bash
sudo systemctl stop tomcat
sudo mkdir $TOMCAT_WEBAPPS/pmsys
sudo systemctl start tomcat

# While the tomcat is starting, sleep for 60 seconds.
echo "Sleeping for 60 seconds. Waiting for tomcat."
sleep 60s 

# If curl is empty, tomcat is ready.
tomcatCurl=$(curl localhost:8080/manager)
tomcatCurlResult=$(echo ${tomcatCurl})

# If curl is not empty, sleep again.
if [ -n "$tomcatCurlResult" ]
then
	echo "Tomcat not yet ready. Sleeping again."
	sleep 60s
fi
	
# By now, tomcat should be ready.
echo "Removing /pmsys directory."
sudo rm -dR $TOMCAT_WEBAPPS/pmsys
echo "Restarted tomcat."