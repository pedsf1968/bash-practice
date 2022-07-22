#!/usr/bin/env bash
# Author: DOS SANTOS FACAO Paul-Emmanuel
# Calculator using awk
read -p "Enter first value: " a
read -p "Enter first value: " b
read -p "Enter operator (+,-,/,*) " operator

case $operator in
  "+")
	  awk -v a=$a -v b=$b 'BEGIN {print "addition : "a,"+ "b,"= "a+b }'
	  ;;

  "-")
	  awk -v a=$a -v b=$b 'BEGIN {print "substration : "a,"- "b,"= "a-b }'
	  ;;

  "*")
	  awk -v a=$a -v b=$b 'BEGIN {print "multiplication : "a,"* "b,"= "a*b }'
	  ;;

  "/")
	  if [[ $b -ne 0 ]]
	  then
		  awk -v a=$a -v b=$b 'BEGIN {print "division : "a,"/ "b,"= "a/b }'
	  else
		  echo "You can't divide by 0 a number"
	  fi
	   ;;
   *)
	   echo "Wrong operator use +, -, * or /"
	   ;;
esac


