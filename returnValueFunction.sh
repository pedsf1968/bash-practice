#!/usr/bin/env bash

define_variable()
{
   local x=79
   echo "$x"
}

y=$(define_variable)
echo "The value of y is: $y"
