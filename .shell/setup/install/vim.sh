#!/usr/bin/env bash

## install Vim 
# Check if Vim is installed
if ! command -v vim &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    # linux and most distros
    echo "Detected ${OSTYPE} ... Installing VIM for Linux ..."
    sudo apt install vim 
  elif [[ "$OSTYPE" == "bsd"* ]]; then
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Detected ${OSTYPE} ... Installing VIM for BSD ..."
    # bsd
    pkg install vim
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected ${OSTYPE} ... Installing VIM for Mac OSX ..."
    # Mac OSX
    brew install vim
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Detected ${OSTYPE} ... Installing VIM for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install vim
  else
    # Unknown.
    echo "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo "VIM installed already . . . Exiting . . ."
fi
