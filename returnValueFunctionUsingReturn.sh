#!/usr/bin/env bash

return_variable()
{
   local x=79
   return $x
}

return_variable
y=$?
echo "The value of y is: $y"
