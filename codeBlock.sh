#!/usr/bin/env bash
#{ ls ; pwd ; date ; }
software=$1
which $software 2>&1 1>/dev/null && { echo "${software^^} is installed on this host" ; echo "${software^^} version is " ; $(echo "$software -v") ; } || echo "${software^^} is not installed"
