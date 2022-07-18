#!/bin/bash
cat << EOF | grep "home"
The user is $USER
The home for this user is $HOME
EOF
