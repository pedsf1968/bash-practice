#!/usr/bin/env bash
title="Git installation"
length=${#title}
columns=$(tput cols)
span=$((($columns + $length)/2 ))
printf "%${columns}s" " " | tr " " "-"
printf "%${span}s\n" "${title}"
printf "%${columns}s" " " | tr " " "-"
