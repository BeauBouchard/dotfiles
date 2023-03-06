#!/usr/bin/env bash

## install ulauncher 
if ! command -v ulauncher &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    echo "Detected ${OSTYPE} ... Installing ulauncher for Linux ..."
    # linux and most distros
    sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher
  elif [[ "$OSTYPE" == "bsd"* ]]; then
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Detected ${OSTYPE} ... Installing ulauncher for BSD ..."
    # bsd
    pkg install ulauncher
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected ${OSTYPE} ... Installing ulauncher for Mac OSX ..."
    # Mac OSX
    brew install ulauncher
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Detected ${OSTYPE} ... Installing ulauncher for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install ulauncher
  else
    # Unknown.
    echo "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo "ulauncher installed already"
fi
