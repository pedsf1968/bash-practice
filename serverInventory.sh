#!/usr/bin/env bash

serverName=$(uname -n)
serverIP=$( ip -4 -br  address | grep enp | head -1 | awk '{print $3}')
serverOSType=$(uname)
serverUpTime=$(uptime | awk '{print $3}' | tr -d ",")

#Creating header in CSV
echo "No,ServerName,ServerIP,ServerOSType,ServerUpTime" > server_info.txt
echo "1,$serverName,$serverIP,$serverOSType,$serverUpTime" >> server_info.txt
