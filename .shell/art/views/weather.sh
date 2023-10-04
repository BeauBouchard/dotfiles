#!/usr/bin/env bash

# this will be the new home, as a view which will take arguements
display_home_motd(){
  set_theme_two

  C_ONE=${1:-"\033[38;5;119m"}
  C_TWO=${2:-"\033[38;5;190m"}
  KERN_VER=$(uname -r)
  LINIX_VER=$(lsb_release -d -s)
  # SP  ' '  0x20 = · U+00B7 Middle Dot
  # TAB '\t' 0x09 = ￫ U+FFEB Halfwidth Rightwards Arrow
  # CR  '\r' 0x0D = § U+00A7 Section Sign (⏎ U+23CE also works fine)
  # LF  '\n' 0x0A = ¶ U+00B6 Pilcrow Sign (was "Paragraph Sign")
  WHITESPACE="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"
  WEATHER=$(curl -s wttr.in/New_York | head -n 7 | sed -e 's/^/         │ /' | sed -e 's/$/                               │/' )



  echo -e "         ┌───────────────────────────────────────────────────────────────┐"
  echo -e "         │                                                               │"
  echo -e "         │ ${BCYAN}${ONWHITE}Distro${RESET}  ${LINIX_VER}       ${BCYAN}${ONWHITE}Kernel${RESET}  ${KERN_VER}     │"
  echo -e "${WEATHER}" 
  echo -e "         │ ┌─┐                                                       ┌─┐ │"
  echo -ne "         └─│─┘            "
  echo -ne "${BWHITE}${ONRED}Standard Bash Shell Loaded ${RESET}${C_TWO}${ONWHITE}${DFV}${RESET}"
  echo  "           └─│─┘"
  echo -e "           └───────────────────────────────────────────────────────────┘"
}
