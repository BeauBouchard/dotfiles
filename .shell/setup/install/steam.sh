## install steam 
if ! command -v steam &> /dev/null; then
  if [[ "$OSTYPE" == "linux-gnu"* ] || [ "$OSTYPE" == "linux"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing Steam for Linux ..."
    # linux and most distros
    sudo add-apt-repository multiverse && sudo apt update  && sudo apt install steam
  elif [[ "$OSTYPE" == "bsd"* ] || [ "$OSTYPE" == "freebsd"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing Steam for BSD ..."
    # bsd
    pkg install steam
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing Steam for Mac OSX ..."
    # Mac OSX
    brew install steam
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo_info "Detected ${OSTYPE} ... Installing Steam for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install steam
  else
    # Unknown.
    echo_alert "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo_info "Steam Intalled already"
fi
