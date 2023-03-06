## install ulauncher
echo "installing ulauncher . . . " && \ 

## install steam 
if ! command -v ulauncher &> /dev/null; then
  if [[ "$OSTYPE" == "linux"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing ulauncher for Linux ..."
    # linux and most distros
    sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher
  elif [[ "$OSTYPE" == "bsd"* ]]; then
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing ulauncher for BSD ..."
    # bsd
    pkg install ulauncher
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing ulauncher for Mac OSX ..."
    # Mac OSX
    brew install ulauncher
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo_info "Detected ${OSTYPE} ... Installing ulauncher for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    chocolatey install ulauncher
  else
    # Unknown.
    echo_alert "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo_info "ulauncher Intalled already"
fi
