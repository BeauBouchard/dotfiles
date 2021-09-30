#!/usr/bin/env bash

set_theme () {
  PS1_1="\033[38;5;${$1}m"
  PS1_2="\033[38;5;${$2}m"
  PS1_3="\033[38;5;${$3}m"
  PS1_4="\033[38;5;${$4}m"
}

set_theme_one() {
  set_theme "033" "177" "190" "255"
}

set_theme_two() {
  set_theme "033" "119" "184" "255" 
}

set_theme_one

# user space
LU="${PS1_1}\u${RESET}"
# machine space
LM="${PS1_2}\h${RESET}"
# directory space
LD="${PS1_3}\w${RESET}"
# branch space
LGH="${PS1_4}\$(git_branch)${RESET}"

export PS1="${LU}@${LM}:${LD}${LGH}\$: "
