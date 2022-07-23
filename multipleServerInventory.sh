#!/usr/bin/env bash

for eachServer in $(cat remote_server.txt)
do
   echo "Executing commands on $eachServer" 
   echo "-------------------------------------------------------------------------------"
   for eachCommand in date uptime "free -m"
   do
      echo "The $eachCommand output on the server: $eachServer"
#      sshpass -f ~/.pass ssh -o StrictHostKeyChecking=No automation@$eachServer "$eachCommand"
      ssh -o StrictHostKeyChecking=No automation@$eachServer "$eachCommand"
      echo "-------------------------------------------------------------------------------"
   done
done
