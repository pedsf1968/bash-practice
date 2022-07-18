#!/usr/bin/env bash

if [[ $(id -u) -eq 0 ]]
then	
   if systemctl status docker 1>/dev/null 2>/dev/null
   then
      echo "Docker is already UP and running"
   else
      echo "Starting Docker service..."
      systemctl start docker
      echo "Successfully started Docker service"
   fi
else
   if sudo -v 1>/dev/null 2>/dev/null
      if systemctl status docker 1>/dev/null 2>/dev/null
      then
         echo "Docker is already UP and running"
      else
         echo "Starting Docker service..."
         systemctl start docker
         echo "Successfully started Docker service"
      fi
   then
      echo "Sorry, you are not allowed to start Docker service, you are not in sodoers!"
   fi
fi
