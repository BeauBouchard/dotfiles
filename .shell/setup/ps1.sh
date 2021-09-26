#!/usr/bin/env bash

# user space
LU="${PS1_1}\u${RESET}"
# machine space
LM="${PS1_2}\h${RESET}"
# directory space
LD="${PS1_3}\w${RESET}"
# branch space
LGH="${PS1_4}\$(git_branch)${RESET}"

export PS1="${LU}@${LM}:${LD}${LGH}\$: "
