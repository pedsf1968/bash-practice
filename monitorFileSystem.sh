#!/usr/bin/env bash

FILE_USAGE_THRESHOLD=15
OUTPUT_FILE="file_system_info.txt"
USER_MAIL=pedsf.fullstack@gmail.com

   echo -e "Server $hostname is running with low RAM Size\nAvailable RAM is $freeRam" | /usr/bin/mail -s "RAM INFO : $(date)" "${USER_MAIL}"

init(){
   rm $OUTPUT_FILE
}

get_file_system_info(){
   df -Ph | grep -vE "Filesystem|tmpfs|none" | while read line
   do
      fileSystemName=$(echo "$line" | awk '{print $1}')
      fileSystemUsage=$(echo "$line" | awk '{print $5}' | sed 's/%//g')
      #echo "File system name: $fileSystemName, usage: $fileSystemUsage"
      if [[ $fileSystemUsage -gt $FILE_USAGE_THRESHOLD ]]
      then
         echo "$fileSystemName: $fileSystemUsage" >> $OUTPUT_FILE
      fi
   done
}

verify_output_file(){
   count=$(cat $OUTPUT_FILE | wc -l)
   if [[ $count -gt 0 ]]
   then
      echo "Some file system usage is over $FILE_USAGE_THRESHOLD% threshold"
      echo -e "Subject:FileSystem Alert\n\n $(cat $OUTPUT_FILE)\n" | /usr/bin/mail -s "FILE SYSTEM INFO : $(date)" "${USER_MAIL}"
 
   fi
}

main(){
   init
   get_file_system_info
   verify_output_file
}

main
