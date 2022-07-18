#!/usr/bin/env bash
x=5
y=89
((sum=x+y))
echo "The addition of $x and $y is $sum"

div=$(bc<<<"scale=3;$y/$x")
echo "The division of $y by $x is $dev"
