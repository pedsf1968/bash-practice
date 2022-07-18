#!/usr/bin/env bash
clear
read -p "Enter num1: " a
read -p "Enter num2: " b
#read -p "Enter your option (1.Addition,2.Substraction,3.Multiplication,4.Division: " opt
echo "
======= Menu for simple calculator =======
1. Addition
2. Substraction
3. Multiplication
4. Division
==========================================
"
read -p "Please select your operation from above menu: " opt
case $opt in
	1)
		echo "You selected addition"
		echo "The addition of $a and $b is $((a+b))"
		;;
	2)
		echo "You selected substraction"
		echo "The substraction of $a and $b is $((a-b))"
		;;

	3)		
		echo "You selected multiplication"
		echo "The multiplication of $a and $b is $((a+b))"
		;;

	4)		
		echo "You selected divistion"
		echo "The division of $a and $b is $((a/b))"
		;;
	*)
		echo "You selected invalid option"
		;;
esac
