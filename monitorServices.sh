#!/usr/bin/env bash

myServices=(docker nginx)

for eachService in ${myServices[@]}
do
   systemctl status $eachService 1>/dev/null 2>/dev/null
   if [[ $? -ne 0 ]]
   then
      echo "The service $eachService is not running"
      echo "The service $eachService is not running on server $(hostname -s)" | /usr/bin/mail -s "Status of $eachService" "pedsf.fullstack@gmail.com"
   fi
done
