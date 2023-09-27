#!/usr/bin/env bash

## install vscode 
# Check if Code is installed
if ! command -v code &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    # linux and most distros
    echo "Detected ${OSTYPE} ... Installing VSCode for Linux ..."
    # is Snap installed?
    if ! command -v snap &> /dev/null; then
      # NO! Snap is not installed
      echo "Snap not installed using apt ..."
      
      # Install Package Dependencies
      echo "Install Package Dependencies ..."
      sudo apt install software-properties-common apt-transport-https wget -y
      # Import the GPG key provided by Microsoft to verify the package integrity.
      echo "Import the Microsoft GPG key ..."
      wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
      # Add Repository
      echo "Adding Repository ..."
      sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
      # Install
      echo "Installing VSCode ..."
      sudo apt install code
    else
      # YES Snap is installed 
      echo "Snap Installed. . . "
      sudo snap install --classic code
    fi
  elif [[ "$OSTYPE" == "bsd"* ]]; then
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Detected ${OSTYPE} ... Installing VSCode for BSD ..."
    # bsd
    pkg install ulauncher
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected ${OSTYPE} ... Installing VSCode for Mac OSX ..."
    # Mac OSX
    brew install ulauncher
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Detected ${OSTYPE} ... Installing VSCode for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install ulauncher
  else
    # Unknown.
    echo "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo "VSCode installed already . . . Exiting . . ."
fi
