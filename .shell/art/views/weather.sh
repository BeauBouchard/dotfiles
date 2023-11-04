#!/usr/bin/env bash

# this will be the new home, as a view which will take arguements
display_weather_motd() {

  C_ONE=${1:-"\033[38;5;119m"}
  C_TWO=${2:-"\033[38;5;190m"}

  echo -e "┌───────────────────────────────────────────────────────────────┐"
  echo -e "│ ┌─┐                                                       ┌─┐ │"
  echo -e "└─│─┘${BCYAN}Distro${RESET}  ${LINIX_VER}     ${BCYAN}Kernel${RESET}  ${KERN_VER}└─│─┘"
  echo -e "  :     Beau's ${C_ONE}Standard Bash Shell Loaded ${RESET}${C_TWO}${DFV}${RESET}               :"
  curl wttr.in/Boston?format="%20%20%20%20%20%l%20:+%t+%c+%C\n"
}


