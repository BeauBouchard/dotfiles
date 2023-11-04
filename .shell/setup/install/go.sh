if ! command -v go &> /dev/null; then
  if [[ "$OSTYPE" == "linux-gnu"* ] || [ "$OSTYPE" == "linux"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing GoLang for Linux ..."
    # linux and most distros
    sudo apt-get install golang-go &&
    # golang path
    export PATH=$PATH:/usr/local/go/bin
  elif [[ "$OSTYPE" == "bsd"* ] || [ "$OSTYPE" == "freebsd"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing GoLang for BSD ..."
    # bsd
    # pkg install golang-go
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing GoLang for Mac OSX ..."
    # Mac OSX
    # brew install golang-go
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo_info "Detected ${OSTYPE} ... Installing GoLang for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    # chocolatey install golang-go
  else
    # Unknown.
    echo_alert "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo_info "GoLang Intalled already"
fi
