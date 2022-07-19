#!/usr/bin/env bash
<<COMMENT
for each in docker nginx
do
   echo "The service is: $each"
done
COMMENT
myServices=(docker nginx)
for each in ${myServices[@]}
do
   echo "The service is: $each"
done
