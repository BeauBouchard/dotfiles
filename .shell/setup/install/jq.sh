if ! command -v jq &> /dev/null; then
  if [[ "$OSTYPE" == "linux-gnu"* ] || [ "$OSTYPE" == "linux"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing JQ for Linux ..."
    # linux and most distros
    sudo apt-get install jq
  elif [[ "$OSTYPE" == "bsd"* ] || [ "$OSTYPE" == "freebsd"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing JQ for BSD ..."
    # bsd
    pkg install jq
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing JQ for Mac OSX ..."
    # Mac OSX
    brew install jq
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo_info "Detected ${OSTYPE} ... Installing JQ for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install jq
  else
    # Unknown.
    echo_alert "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo_info "jq Intalled already"
fi
