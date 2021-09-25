#!/usr/bin/env bash

readonly DFV="v0.1.3"

# reset
readonly RESET="\033[0m"           # Text Reset
readonly NC="\e[m"                 # Color Reset

# color variables
readonly BLACK="\033[0;30m"        # Black
readonly RED="\033[0;31m"          # Red
readonly GREEN="\033[0;32m"        # Green
readonly YELLOW="\033[0;33m"       # Yellow
readonly BLUE="\033[0;34m"         # Blue
readonly PURPLE="\033[0;35m"       # Purple
readonly CYAN="\033[0;36m"         # Cyan
readonly WHITE="\033[0;37m"        # White

# bold
readonly BBLACK='\e[1;30m'         # Black
readonly BRED='\e[1;31m'           # Red
readonly BGREEN='\e[1;32m'         # Green
readonly BYELLOW='\e[1;33m'        # Yellow
readonly BBLUE='\e[1;34m'          # Blue
readonly BPURPLE='\e[1;35m'        # Purple
readonly BCYAN='\e[1;36m'          # Cyan
readonly BWHITE='\e[1;37m'         # White

# background
readonly ONBLACK='\e[40m'          # Black
readonly ONRED='\e[41m'            # Red
readonly ONGREEN='\e[42m'          # Green
readonly ONYELLOW='\e[43m'         # Yellow
readonly ONBLUE='\e[44m'           # Blue
readonly ONPURPLE='\e[45m'         # Purple
readonly ONCYAN='\e[46m'           # Cyan
readonly ONWHITE='\e[47m'          # White

# echo/color - echo color adds a color wrapper then resets
# usage: echo/color <ANSII color code> <message to add color to>
# example:
#   echo/color "\033[0;31m" "THIS MESSAGE IS RED"
echo_color() {
  echo -e "$@${RESET}"
}

# echo/color/n - same as color, but has no endline
# usage: echo/color/n <ANSII color code> <message to add color to>
# example:
#   echo/color/n "\033[0;31m" "THIS MESSAGE IS RED"
echo_color_n() {
  echo -ne "$@${RESET}"
}

# echo/warn - echo with yellow warning color wrapper
# usage: echo/warn <message to add color to>
# example:
#   echo/warn "THIS MESSAGE IS YELLOW"
echo_warn() {
  echo_color [${BWHITE}${ONYELLOW}$@${RESET}]
}

# echo/alert - echo with red alert color wrapper
# usage: echo/alert <message to add color to>
# example:
#   echo/alert "THIS MESSAGE IS RED"
echo_alert() {
  echo_color [${BWHITE}${ONRED}$@${RESET}]
}

# echo/success - echo with green alert color wrapper
# usage: echo/success <message to add color to>
# example:
#   echo/success "THIS MESSAGE IS GREEN"
echo_success() {
  echo_color [${BWHITE}${ONGREEN}$@${RESET}]
}

# input decision for user, useful for assigning variiable values
# usage: prompt/user <prompt message> [fallback value*]
#   * uses fallback/default value if no input recieved
# example:
#   name=$(input/user  "what is your name?")
#   port=$(input/user  "what port for server?" 8080)
input_user() {
  local input=
  # set text prompt value
  local prompt="${1:-value}"
  # set default value
  local default="$2"
  [ -z "$default" ] || prompt+=" [$default]"

  # convert escape sequences in prompt to ansi codes
  prompt="$(echo -e -n "$prompt : ")"

  while [ -z "$input" ]; do
    if [ -t 0 ]; then
      # user input
      read -p "$prompt" input </dev/tty
    else
      # piped input
      read input
    fi

    [[ -n "$default" && -z "$input" ]] && input="$default"
    [ -z "$input" ] && echo_warn "invalid input"

  done
  echo "$input"
}

# input/confirm - simple boolean decision to confirm
# usage: input/confirm [message]
# examples:
#  input/confirm "are you sure?" || exit 0
input_confirm() {
  while true; do
    case $(input_user "${@:-Continue?} [y/n]") in
      [yY]) return 0 ;;
      [nN]) return 1 ;;
      *) echo/warn "invalid input"
    esac
  done
}

# git/branch - returns the current git branch for the current environment
# usage: git/branch
# examples:
#  git/branch
# returns: "(main)"
# * Note: branch name is surrouned by "()" in return string
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

gmail() { 
  curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/</fullcount.*/n/' | sed -e 's/.*fullcount>//'
}

# getAbsolutePath
# path/abs - returns the absolute path from ran directory
# usage: path/abs
# examples:
#  path/abs
# returns: "/home/root/Pictures/cats/orange/kittens/"
# * NOTE: returned string starts and ends with "/"
path_abs(){
  [[ -d $1 ]] && { cd "$1"; echo "$(pwd -P)"; } ||
  { cd "$(dirname "$1")"; echo "$(pwd -P)/$(basename "$1")"; }
}

main() {
  echo_success "shell utils loaded!"
}

main
