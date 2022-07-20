#!/bin/bash
#Author: PEDSF
#Installing multiples packages

EXIT_WRONG_USE=1
EXIT_NOT_ROOT=2

if [[ $# -eq 0 ]]
then
  echo "Usage: $0 package1 [package2 ...]"
  exit $EXIT_WRONG_USE
fi

if [[ $(id -u) -ne 0 ]]
then
   echo "Please run from root user or with sudo privilege!"
   exit $EXIT_NOT_ROOT
fi

for packageName in $@
do
   if which vim &>/dev/null
   then
      echo "$packageName is already installed"
   else
      echo "Installing $packageName"
      apt-get install $packageName -y &>/dev/null 
      if [[ $? -eq 0 ]]
      then
         echo "Successfully installed $packageName package"
      else
         echo "Unable to install $packageName package!"
      fi
   fi
done
