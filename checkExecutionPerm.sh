#!/usr/bin/env bash

if [[ $# -ne 1 ]]
then
   echo "Usage: $0 <any_path>"
   exit 1
fi

givenPath=$1
for each in $(ls $givenPath)
do
   if [[ -x $each ]] 
   then 
      echo "The file $each is having execution permision" 
   else
      echo "$each is not having execution permision" 
   fi
done
