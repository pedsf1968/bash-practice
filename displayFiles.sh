#!/usr/bin/env bash
<<COMMENT
counter=1
for fileName in $(ls *.sh)
do
   if [[ $counter -eq 1 ]]
   then
      echo "$fileName"
      ((counter++))
   fi
done
COMMENT
echo "starting the loop"
counter=1
for fileName in $(ls *.sh)
do
   if [[ $counter -eq 1 ]]
   then
     echo "$fileName"
     break 
   fi
done

echo "for loop is over"

