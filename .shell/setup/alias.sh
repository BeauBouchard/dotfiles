#!/usr/bin/env bash

## Aliases
alias ..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"

# CD Project base home
alias cdh="cd ~/Projects/"
alias grep='grep --color=auto' 

alias listen="lsof -P -i -n" 
alias port='netstat -tulanp'
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host" 

alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" 
