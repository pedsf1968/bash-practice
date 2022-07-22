#!/usr/bin/env bash
pwd
date
a=$(awk 'BEGIN { print "Hello World!"}')
b=$(awk -f awk/helloWorld.awk)

echo "a value is: $a"
echo "b value is: $b"
