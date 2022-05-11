#!/usr/bin/env bash

# this will be the new home, as a view which will take arguements
display_home_motd(){
  set_theme_two

  C_ONE=${1:-"\033[38;5;119m"}
  C_TWO=${2:-"\033[38;5;190m"}
 
  echo -e "         ┌───────────────────────────────────────────────────────────────┐"
  echo -e "         :                                                               :"

  echo -e "${C_ONE}██${C_TWO}╗    ${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╗ ${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╗${C_ONE}████████${C_TWO}╗${C_ONE}███████${C_TWO}╗${C_ONE}██████${C_TWO}╗  ${C_ONE}████${C_TWO}╗ ${C_ONE}██████${C_TWO}╗ ${C_ONE}██████${C_TWO}╗ ${C_ONE}██${C_TWO}╗${C_ONE}████████${C_TWO}╗"
  echo -e "${C_ONE}██${C_TWO}║    ${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}║ ${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}║╚══${C_ONE}██${C_TWO}╔══╝${C_ONE}██${C_TWO}╔════╝${C_ONE}██${C_TWO}╔══${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╔═${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╔══${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╔══${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}║╚══${C_ONE}██${C_TWO}╔══╝"
  echo -e "${C_ONE}██${C_TWO}║ ${C_ONE}█${C_TWO}╗ ${C_ONE}██${C_TWO}║${C_ONE}██████${C_TWO}║${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}║   ${C_ONE}█████${C_TWO}╗  ${C_ONE}██████${C_TWO}╔╝${C_ONE}██████${C_TWO}║${C_ONE}██████${C_TWO}╔╝${C_ONE}██████${C_TWO}╔╝${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}║   "
  echo -e "${C_ONE}██${C_TWO}║${C_ONE}███${C_TWO}╗${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}╔═${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}╔══╝  ${C_ONE}██${C_TWO}╔══${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╔═${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}╔══${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}╔══${C_ONE}██${C_TWO}╗${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}║   "
  echo -e "${C_TWO}╚${C_ONE}███${C_TWO}╔${C_ONE}███${C_TWO}╔╝${C_ONE}██${C_TWO}║ ${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}║   ${C_ONE}███████${C_TWO}╗${C_ONE}██${C_TWO}║  ${C_ONE}██${C_TWO}║${C_ONE}██${C_TWO}║ ${C_ONE}██${C_TWO}║${C_ONE}██████${C_TWO}╔╝${C_ONE}██████${C_TWO}╔╝${C_ONE}██${C_TWO}║   ${C_ONE}██${C_TWO}║   "
  echo -e " ${C_TWO}╚══╝╚══╝ ╚═╝ ╚═╝╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝ ╚═╝╚═════╝ ╚═════╝ ╚═╝   ╚═╝   ${RESET}"
  echo -e "         : ┌─┐                                                       ┌─┐ :"
  echo -ne "          └─│─┘            "
  echo -ne "${BWHITE}${ONRED}Standard Bash Shell Loaded ${RESET}${C_TWO}${ONWHITE}${DFV}${RESET}"
  echo  "          └─│─┘"
  echo -e "           └───────────────────────────────────────────────────────────┘"
}

