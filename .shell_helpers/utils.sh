#!/usr/bin/env bash

# reset
readonly RESET="\033[0m"       # Text Reset

# color variables
readonly BLACK="\033[0;30m"        # Black
readonly RED="\033[0;31m"          # Red
readonly GREEN="\033[0;32m"        # Green
readonly YELLOW="\033[0;33m"       # Yellow
readonly BLUE="\033[0;34m"         # Blue
readonly PURPLE="\033[0;35m"       # Purple
readonly CYAN="\033[0;36m"         # Cyan
readonly WHITE="\033[0;37m"        # White

# echoc - echo color adds a color wrapper then resets
echoc() {
  echo -e "$1$2${RESET}"
}
