#!/usr/bin/env bash

RS="\[\033[0m\]"           # Text Reset

set_theme () {
  PS1_1="\[\033[38;5;$1m\]"
  PS1_2="\[\033[38;5;$2m\]"
  PS1_3="\[\033[38;5;$3m\]"
  PS1_4="\[\033[38;5;$4m\]"
}

set_theme_one() {
  set_theme "033" "177" "190" "255"
  export_theme
}

set_theme_two() {
  set_theme "033" "119" "184" "255" 
  export_theme
}

# user space
LU="${PS1_1}\u${RS}"
# machine space
LM="${PS1_2}\h${RS}"
# directory space
LD="${PS1_3}\w${RS}"
# branch space
LGH="${PS1_4}\$(git_branch)${RS}"

export_theme() {
  export PS1="${LU}@${LM}:${LD}${LGH}\$: "
}

