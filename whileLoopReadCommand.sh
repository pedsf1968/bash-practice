#!/usr/bin/env bash

#cat loremIpsum.txt | while read eachLine
ls -lrt | while read eachLine
do
   echo "$eachLine"
done 
