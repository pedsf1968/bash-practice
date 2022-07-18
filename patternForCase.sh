#!/usr/bin/env bash
read -p "Enter any number: " num
case $num in
	[0-9])
		echo "You entered a single number"
		;;
	[a-z])	
		echo "You entered lower case alphanumeric"
		;;
	[A-Z])
		echo "You entered upper case alphanumeric"
		;;
	*)
		echo "Unable to identify your input!"
esac
