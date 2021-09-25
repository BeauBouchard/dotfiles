#!/usr/bin/env bash

# Make sure 256 color terminals are enabled
export TERM=xterm-256color


export PS1="\[\033[38;5;033m\]\u\[\033[0m\]@\[\033[38;5;119m\]\h\[\033[0m\]:\[\033[38;5;184m\]\w\[\033[0m\]\[\033[38;5;255m\]\$(git_branch)\$\[\033[0m\]: "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

main() {
  echo_success "PS1 loaded!"
}

main
