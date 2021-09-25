#!/usr/bin/env bash

# Make sure 256 color terminals are enabled
export TERM=xterm-256color

# just a basic color scheme
PRI="\[\033[38;5;033m\]"
SEC="\[\033[38;5;119m\]"
TRI="\[\033[38;5;184m\]"
QUA="\[\033[38;5;255m\]"

# user space
LU="${PRI}\u${RESET}"
# machine space
LM="${SEC}\h${RESET}"
# directory space
LD="${TRI}\w${RESET}"
# branch space
LGH="${QUA}\$(git_branch)${RESET}"


export PS1="${LU}@${LM}:${LD}${LGH}\$: "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

main() {
  echo_success "PS1 loaded!"
}

main
