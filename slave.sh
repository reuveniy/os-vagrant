#!/bin/bash
token="$(wget "http://172.19.8.101:8080/v1/registrationtokens?projectId=1a5" -O - | tr '"' '\n' | grep ^token -A3 | head -3 | tail -1)"
echo "Registration token: ${token}"
sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.1 http://172.19.8.101:8080/v1/scripts/${token}
