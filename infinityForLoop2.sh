#!/usr/bin/env bash

counter=1
echo "Starting of the loop"
for ((;;))
do
   echo "This is a infiny loop that break"
   ((counter++))
   sleep 1
   if [[ $counter -eq 5 ]]
   then
      break
   fi
done
echo "Ending of the loop"
