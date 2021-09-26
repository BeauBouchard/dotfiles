#!/usr/bin/env bash

# Make sure 256 color terminals are enabled
export TERM=xterm-256color

# just a basic PS1 color scheme
PS1_1="\[\033[38;5;033m\]"
PS1_2="\[\033[38;5;177m\]" # 119
PS1_3="\[\033[38;5;190m\]" # 184
PS1_4="\[\033[38;5;255m\]"

# user space
LU="${PS1_1}\u${RESET}"
# machine space
LM="${PS1_2}\h${RESET}"
# directory space
LD="${PS1_3}\w${RESET}"
# branch space
LGH="${PS1_4}\$(git_branch)${RESET}"


export PS1="${LU}@${LM}:${LD}${LGH}\$: "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

main() {
  echo_success "PS1 loaded!"
}

main
