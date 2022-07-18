#!/usr/bin/env bash

#for each_value in 1 2 3
for each_value in $(ls)
do
   echo "This is a loop"
   echo "For this iteration each_value is $each_value"
done
