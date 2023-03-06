#!/usr/bin/env bash

## install steam 
if ! command -v steam &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    echo "Detected ${OSTYPE} ... Installing Steam for Linux ..."
    # linux and most distros
    sudo add-apt-repository multiverse && sudo apt update  && sudo apt install steam
  elif [[ "$OSTYPE" == "bsd"* ]]; then
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Detected ${OSTYPE} ... Installing Steam for BSD ..."
    # bsd
    pkg install steam
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected ${OSTYPE} ... Installing Steam for Mac OSX ..."
    # Mac OSX
    brew install steam
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Detected ${OSTYPE} ... Installing Steam for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install steam
  else
    # Unknown.
    echo "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo "Steam Installed already"
fi
