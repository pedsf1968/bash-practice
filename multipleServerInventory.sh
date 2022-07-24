#!/usr/bin/env bash
# you must define SSHPASS variable with your user password


REMOTE_USER_FILE="$HOME/.ssh/remoteuser"
REMOTE_USER=$(cat "$REMOTE_USER_FILE")
REMOTE_PASS="$HOME/.ssh/remotepass"
REMOTE_SERVERS="$HOME/bash-practice/serversList.txt"
SSH_OPTIONS="sshpass -f $REMOTE_PASS ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No"
OUTPUT_FILE="servers_config.csv"
EXIT_NO_USER_FILE=1
EXIT_NO_PASSWORD_FILE=2
EXIT_NO_SERVER_FILE=3

######################################################################### BANNER
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

################################################################### CHECK CONFIG
check_remoteuser(){
   if [[ ! -e "$REMOTE_USER_FILE" ]]
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

####################################################################### GET INFO
get_ostype(){
   server=$1
   osType=$($SSH_OPTIONS $REMOTE_USER@$server "cat /etc/os-release" | grep -w "NAME"|awk -F '[" ]' '{print $2}')
   echo "$osType"
}

get_osversion(){
   server=$1
   osType=$2

   case $osType in
   "Ubuntu")
       osVersion=$($SSH_OPTIONS $REMOTE_USER@$server "cat /etc/os-release" | grep -w "VERSION_ID" | awk -F "VERSION_ID=" '{print $2}')
      ;;
   "Fedora")
      osVersion=$($SSH_OPTIONS $REMOTE_USER@$server "cat /etc/os-release" | grep -w "VERSION_ID" | awk -F '=' '{print $2}')
      ;;
   *)
      osVersion="Not found"
   esac 
   echo "$osVersion"
}

get_arctype(){
   server=$1
   echo $($SSH_OPTIONS $REMOTE_USER@$server "uname -p")
}

get_cputype(){
   server=$1
   echo $($SSH_OPTIONS $REMOTE_USER@$server "cat /proc/cpuinfo | grep 'model name' | cut -d':' -f2 | head -1")
}

###################################################################### PULL-INFO
pull_info(){
    echo "OS type,OS version,Architecture Type,CPU" > $OUTPUT_FILE
   while read server
   do
      echo "Work on server $server"
      osType=$(get_ostype $server)
      osVersion=$(get_osversion $server $osType)
      arcType=$(get_arctype $server)
      cpuType=$(get_cputype $server)
      echo "$osType,$osVersion,$arcType,$cpuType" >> $OUTPUT_FILE
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
