
#!/usr/bin/env bash

## install nvm 
if ! command -v nvm &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    echo "Detected ${OSTYPE} ... Installing NVM for Linux ..."
    # linux and most distros
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    echo " "
    echo "\# NVM Stuff "
    echo "export NVM_DIR=\"$HOME/.nvm\"" >> .bash_profile
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> .bash_profile
    echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> .bash_profile

    echo "export NVM_DIR=\"$HOME/.nvm\"" >> .bashrc
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> .bashrc
    echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> .bashrc
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
  echo "NVM Intalled already"
fi
