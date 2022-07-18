#!/usr/bin/env bash

USER_MAIL=pedsf.fullstack@gmail.com

THRESHOLD_RAM=4000
freeRam=$(free -mt | grep -E "Total" | awk '{print $4}')

if [[ $freeRam -lt $THRESHOLD_RAM ]]
then
   echo "Send mail"
   echo -e "Server $hostname is running with low RAM Size\nAvailable RAM is $freeRam" | /usr/bin/mail -s "RAM INFO : $(date)" "${USER_MAIL}"
fi


