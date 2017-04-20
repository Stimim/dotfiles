#!/usr/bin/env bash

add_to_path() {
  if [ $# -le 0 ] ; then
    echo "Missing parameter"
    return
  fi
  if [ -d "$1" ] && [[ ":${PATH}:" != *:${1}:* ]] ; then
    PATH=${PATH}:${1}
    echo "\"$1\" is added to PATH"
  fi
}

add_to_path /sbin
add_to_path ~/.local/bin
add_to_path ~/depot_tools

export PATH
