#!/usr/bin/env bash

USER_MAIL=pedsf.fullstack@gmail.com
FS_THRESHOLD=10
FS_USE=$( df -H | grep -E "sda2" | awk '{print $5}' | tr -d "%")

if [[ $FS_USE -ge $FS_THRESHOLD ]]
then
   echo "The file system /dev/sda2 usage on $(hostname -s) is:\n $FS_USE"  | /usr/bin/mail -s "File System utilization : $(date)" "${USER_MAIL}"
fi


