#!/usr/bin/env bash
<< LOGICALAND
read -p "Enter your number: " num

# if [[ $num -ge 50 ]] && [[ $num -le 100 ]]
# if [[ $num -ge 50 && $num -le 100 ]]
if [ $num -ge 50 -a $num -le 100 ]
then
   echo "$num is in the range of 50 to 100"
else
   echo "$num is not in the range of 50 to 100"
fi
LOGICALAND

read -p "Enter confirmation to start Docker: (say yes or no)? " response

# if [[ $response == "yes" ]] || [[ $response == "y" ]]
# if [[ $response == "yes" || $response == "y" ]]
# if [ $response == "yes" -o $response == "y" ]
# if [ "$response" = "yes" ]
#if [ $response = yes -o $response = y ]
 if [[ $response =~ yes|y ]]
then
   echo "Starting Docker"
   sudo systemctl start docker
else
   echo "Skipping...."
fi
