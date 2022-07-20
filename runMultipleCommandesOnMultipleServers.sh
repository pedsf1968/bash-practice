#!/usr/bin/env bash
<<COMMENT
echo "The date command output on the server: 192.168.1.45"
sshpass -f ~/.pass ssh -o StrictHostKeyChecking=No automation@192.168.1.45 "date"
echo "-------------------------------------------------------------------------------"
echo "The uptime command output on the server: 192.168.1.45"
sshpass -f ~/.pass ssh -o StrictHostKeyChecking=No automation@192.168.1.45 "uptime"
echo "-------------------------------------------------------------------------------"
echo "The free -m command output on the server: 192.168.1.45"
sshpass -f ~/.pass ssh -o StrictHostKeyChecking=No automation@192.168.1.45 "free -m"
COMMENT

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
