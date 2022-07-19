#!/usr/bin/env bash

echo "Starting the loop"
<<COMMENT
for each in $(seq 1 10)
do
   if [[ $each -ne 5 ]]
   then
      echo "$each"
   fi
done
COMMENT
for each in $(seq 1 10)
do
   if [[ $each -eq 5 ]]
   then
	   continue
   fi
   echo "$each"
done
echo "for loop is done"
