#!/usr/bin/env bash
timeStamp=$(date +%y%m%d-%H%M)
directory=/home/ansible/practice/logs
fileName=$directory/myjob-$timeStamp.log
touch $fileName
