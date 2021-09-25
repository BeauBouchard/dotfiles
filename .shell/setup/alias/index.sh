#!/usr/bin/env bash

## Aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias ..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"

# CD Project base home
alias cdh="cd ~/Projects/"
alias ls="ls --color=auto" 
alias ll="ls --color -al" 
alias grep='grep --color=auto' 

alias listen="lsof -P -i -n" 
alias port='netstat -tulanp'
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host" 

alias busy="cat /dev/urandom | hexdump -C | grep "ca fe"" 



main() {
  echo_success "aliases loaded!"
}

main
