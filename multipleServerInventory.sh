#!/usr/bin/env bash
# you must define SSHPASS variable with your user password

REMOTE_USER="$HOME/.ssh/remoteuser"
REMOTE_PASS="$HOME/.ssh/remotepass"
REMOTE_SERVERS="$HOME/bash-practice/serversList.txt"
SSH_OPTIONS="sshpass -f $REMOTE_PASS ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No"
EXIT_NO_USER_FILE=1
EXIT_NO_PASSWORD_FILE=2
EXIT_NO_SERVER_FILE=3

display_separator(){
   printf "#%0.s" $(seq 1 $(tput cols))
   printf "\n"
}

display_banner(){
   msg=$1
   nbCols=$(tput cols)
   msgLen=$(echo ${#msg})
   span=$(( $((nbCols-msgLen))/2 ))

   display_separator
   printf " %0.s" $(seq 1 $span)
   printf "%s" "$msg"
   printf "\n"
   display_separator

}

check_remoteuser(){
   if [[ ! -e "$REMOTE_USER" ]]
   then
      display_banner "Please store your login in $REMOTE_USER file"
      exit $EXIT_NO_USER_FILE
   fi
}

check_remotepass(){
   if [[ ! -e "$REMOTE_PASS" ]]
   then
      display_banner "Please store your password in $REMOTE_PASS file"
      exit $EXIT_NO_PASSWORD_FILE
   fi
}

check_remoteservers(){
   if [[ ! -e "$REMOTE_SERVERS" ]]
   then
      display_banner "Please store your servers in $REMOTE_SERVERS file"
      exit $EXIT_SERVER_FILE
   fi
}

pull_info(){
   echo "Pull info"
   userLogin=$( cat $REMOTE_USER)
   while read server
   do
      echo "Work on server $server"
      osType=$($SSH_OPTIONS $userLogin@$server "cat /etc/os-release" | grep -w "NAME"|awk -F "NAME=" '{print $2}'|tr '"' ' ')
      echo "$osType" | grep -i "ubuntu" 1>/dev/null 2>&1
      if [[ $? -eq 0 ]]
      then
         osVersion=$($SSH_OPTIONS $userLogin@$server "cat /etc/os-release" | grep -w "VERSION_ID" | awk -F "VERSION_ID=" '{print $2}')
      else
         osVersion=$($SSH_OPTIONS $userLogin@$server "cat /etc/redhat-release" | awk -F "release" | awk '{print $1}')
      fi
      arcType=$($SSH_OPTIONS $userLogin@$server "uname -p")
      cpuType=$($SSH_OPTIONS $userLogin@$server "cat /proc/cpuinfo | grep 'model name' | cut -d':' -f2 | head -1")
      echo "OS type: $osType\n OS version: $osVersion\n Architecture Type: $arcType\n CPU: $cpuType"
   done < $REMOTE_SERVERS
}

main(){
   display_banner "Welcome to Inventory script"
   check_remoteuser
   check_remotepass
   check_remoteservers
   pull_info
   display_banner "Thank you for using this shell script"
}

main
