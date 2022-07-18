#!/usr/bin/env bash

if [[ $# -ne 2 ]]
then
	echo "Script not launched properly!"
	echo "Usage: $0 <serviceName> <ActionToExecuteOnService>"
	echo "Valid actions are : start, stop, restart and status"
	exit 1
fi
# read -p "Enter your service to execute action on it " serviceName
# read -p "Enter your action to execute on the service $serviceName " serviceAction 

serviceName=$1
serviceAction=$2
sudo systemctl ${serviceAction} ${serviceName}
