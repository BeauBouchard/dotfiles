

if ! command -v cargo -V &> /dev/null; then
  if [[ "$OSTYPE" == "linux-gnu"* ] || [ "$OSTYPE" == "linux"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing RustLang for Linux ..."
    # linux and most distros
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
    source "$HOME/.cargo/env"

  elif [[ "$OSTYPE" == "bsd"* ] || [ "$OSTYPE" == "freebsd"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing RustLang for BSD ..."
    # bsd
    # pkg install xxx
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo_info "Detected ${OSTYPE} ... Installing RustLang for Mac OSX ..."
    # Mac OSX
    # brew install xxx
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo_info "Detected ${OSTYPE} ... Installing RustLang for Cygwin / Windows ..."
    # POSIX compatibility layer and Linux environment emulation for Windows
    # chocolatey install xxx
  else
    # Unknown.
    echo_alert "ERROR: Unknown OS ${OSTYPE}"
  fi
else
  echo_info "RustLang Intalled already"
fi
