#!/usr/bin/env bash
# Author : PEDSF
# Version : 220716-1442
# Usage : start, stop, restart and give version of docker

if [[ $(id -u) -ne 0 ]]
then
   echo "You are not allowed to run this script"
   exit 1
fi

read -p "Enter your option: " option

if [[ $option == start ]]
then
   echo "Starting Docker..."
   systemctl start docker
elif [[ $option == stop ]]
then
   echo "Stopping Docker..."
   systemctl stop docker
elif [[ $option == restart ]]
then
   echo "Restarting Docker..."
   systemctl restart docker
elif [[ $option == version ]]
then
   version=$(docker -v | cut -d " " -f 3 | tr -d ",")
   echo "The version of docker is $version"
else
   echo "Your option is invalid!"
   echo "Valid options are: start, stop, restart and version"
fi


