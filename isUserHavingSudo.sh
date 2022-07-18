#!/usr/bin/env bash
#sudo -v 1>/dev/null 2>/dev/null &&  echo "The user $(id -un) is having sudo privileges on this host $(hostname)" || echo "The user $(id -un) is not having sudo privileges on this host $(hostname)"
if sudo -v 1>/dev/null 2>/dev/null
then
  echo "The user $(id -un) is having sudo privileges on this host $(hostname)"
else
  echo "The user $(id -un) is not having sudo privileges on this host $(hostname)"
fi
