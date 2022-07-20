#!/usr/bin/env bash

fileName=loremIpsum.txt
while read eachLine
do
   echo "$eachLine"
   ((counter++))
done < $fileName
