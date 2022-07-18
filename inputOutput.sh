#!/usr/bin/env bash
<< COMMENT
read -p "Enter your name: " myName
myNameUpper=${myName^^}
echo "Your name in upper-case is $myNameUpper"
COMMENT
read -p "Enter a string: "
echo "$REPLY"
