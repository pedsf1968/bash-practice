#!/usr/bin/env bash
read -p "Enter the first number: " a
read -p "Enter the second number: " b
# ((sum=a+b))
sum=$(bc<<<"scale=2;$a+$b")
echo "The addition of $a and $b is $sum"

