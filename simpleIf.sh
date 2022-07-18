#!/usr/bin/env bash
echo "Test command itself"
if which docker 2>&1 1>/dev/null
then
  echo "Docker is installed on this host"
  echo "The Docker version is $(docker -v)"
fi

echo "Test the command result"
which docker 2>&1 1> /dev/null
if [[ $? -eq 0 ]]
then
  echo "Docker is installed on this host"
  echo "The Docker version is $(docker -v)"
fi
