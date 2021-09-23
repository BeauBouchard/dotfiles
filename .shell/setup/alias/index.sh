#!/usr/bin/env bash

## Aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias ..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"

# CD Project base home
alias cdh="cd ~/Projects/"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gf="git fetch"
alias gp="git pull"
alias gs="git status"
alias gpo="git push origin"
alias addall="git add -A"
alias commitit="git commit -am"
alias pushit="git push origin head"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"

main() {
  echo/success "aliases loaded!"
}

main