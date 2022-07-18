#!/usr/bin/env bash
<<COMMENT
echo "$0"
echo "$1"
echo "$2"
echo "$3"
echo "${10}"
COMMENT
echo "The number of arguments is $#"
echo "The all command line arguments are: $@"
echo "The all command line arguments are: $*"
