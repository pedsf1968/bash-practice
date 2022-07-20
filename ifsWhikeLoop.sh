#!/usr/bin/env bash

<<COMMENT
while IFS="," read f1 f2 f3 f4 f5
do 
	echo "$f2"
done < servers_info.csv

cat servers_info.csv | awk 'NR!=1 {print}' | while IFS="," read f1 f2 f3 f4 f5
do 
   echo "$f1 $f2"
done
COMMENT

OLD_IFS=$IFS
cat servers_info.csv | awk 'NR!=1 {print}' | while IFS="," read f1 f2
do 
   echo "Field 1: $f1"
   echo "Field 2: $f2"
done

IFS=$OLD_IFS
