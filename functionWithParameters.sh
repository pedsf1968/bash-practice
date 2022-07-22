#!/usr/bin/env bash

addition()
{
   echo "The \$0 value is: $0"
   m=$1
   n=$2
   result=$((m+n))
   echo "The addition of $m and $n is $result"
}

x=5
y=2
addition $x $y
p=3
q=7
addition $p $q

addition 68 79
