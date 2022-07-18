#!/usr/bin/env bash
software=$1
if which $software 2>&1 1>/dev/null
then 
	echo "${software^^} is installed on this host"
        echo "${software^^} version is  ";  $(echo "$software -v") 
else
	echo "${software^^} is not installed"
fi
