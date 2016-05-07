#!/bin/bash
sudo docker run -d --restart=always -p 8080:8080 rancher/server --name "rancher-server"
echo "Waiting for rancher/server to load"
while [ -n "$(wget http://localhost:8080 2>&1 | grep error)" ]; do sleep 10; echo "rancher/server not running yet"; done
wget --post-data="" "http://localhost:8080/v1/registrationtokens?projectId=1a5" || true