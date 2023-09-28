#!/usr/bin/env bash

## install nvm 
if ! command -v nvm &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    echo "Detected ${OSTYPE} ... Installing NVM for Linux ..."
    # linux and most distros
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

    echo " "
    echo "\# NVM Stuff "
    echo "export NVM_DIR=\"$([ -z \"${XDG_CONFIG_HOME-}\" ] && printf %s \"${HOME}/.nvm\" || printf %s \"${XDG_CONFIG_HOME}/nvm\")\"" >> .bash_profile 
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> .bash_profile # This loads nvm

    echo "export NVM_DIR=\"$([ -z \"${XDG_CONFIG_HOME-}\" ] && printf %s \"${HOME}/.nvm\" || printf %s \"${XDG_CONFIG_HOME}/nvm\")\"" >> .bashrc 
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> .bashrc # This loads nvm 

  elif [[ "$OSTYPE" == "bsd"* ]]; then
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Detected ${OSTYPE} ... Installing NVM for BSD ..."
    # bsd
    pkg install nvm
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected ${OSTYPE} ... Installing NVM for Mac OSX ..."
    # Mac OSX
    brew install nvm
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Detected ${OSTYPE} ... Installing NVM for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install nvm
  else
    # Unknown.
    echo "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo "NVM Installed already"
fi
