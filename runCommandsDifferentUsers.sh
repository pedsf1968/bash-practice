#!/usr/bin/env bash

while read serverIP userLogin userPassword command
do
   echo "Executing $command on the server $serverIP using user $userLogin"
   sshpass -p $userPassword ssh -n -o StrictHostKeyChecking=No $userLogin@$serverIP "$command"
done < servers_info.txt
