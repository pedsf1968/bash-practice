#!/usr/bin/awk -f
BEGIN {
   print "Finding a and b values for ab.txt"
}
{
   a=$1
   b=$2
   print "a="a, "b="b 
}

END {
   print "Completed reading a and b values"
}
