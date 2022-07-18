#!/bin/bash
dockerVersion=$(docker -v | awk '/version/ {print $3}' | tr -d ",")
dockerStatus=$( systemctl status docker | awk '/Active/ {print $3}' | tr -d '[()]')
echo "The Docker version is $dockerVersion"
echo "The Docker status is $dockerStatus"
