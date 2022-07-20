#!/usr/bin/env bash

counter=1
while [[ $counter -le 10 ]]
do
   echo "executing while loop"
   echo "$counter"
   ((counter++))
done
