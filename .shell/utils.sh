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

# echo/color - echo color adds a color wrapper then resets
# usage: echo/color <ANSII color code> <message to add color to>
# example:
#   echo/color "\033[0;31m" "THIS MESSAGE IS RED"
echo:color() {
  echo -e "$@${RESET}"
}

# echo/color/n - same as color, but has no endline
# usage: echo/color/n <ANSII color code> <message to add color to>
# example:
#   echo/color/n "\033[0;31m" "THIS MESSAGE IS RED"
echo:color/n() {
  echo -en "$@${RESET}"
}

# echo/warn - echo with yellow warning color wrapper
# usage: echo/warn <message to add color to>
# example:
#   echo/warn "THIS MESSAGE IS YELLOW"
echo:warn() {
  echo:color ${YELLOW} $@
}

# echo/alert - echo with red alert color wrapper
# usage: echo/alert <message to add color to>
# example:
#   echo/alert "THIS MESSAGE IS RED"
echo:alert() {
  echo:color ${RED} $@
}

# echo/success - echo with green alert color wrapper
# usage: echo/success <message to add color to>
# example:
#   echo/success "THIS MESSAGE IS GREEN"
echo:success() {
  echo:color ${GREEN} $@
}

# input decision for user, useful for assigning variiable values
# usage: prompt/user <prompt message> [fallback value*]
#   * uses fallback/default value if no input recieved
# example:
#   name=$(input/user  "what is your name?")
#   port=$(input/user  "what port for server?" 8080)
input/user() {
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
    [ -z "$input" ] && echo/warn "invalid input"

  done
  echo "$input"
}

# input/confirm - simple boolean decision to confirm
# usage: input/confirm [message]
# examples:
#  input/confirm "are you sure?" || exit 0
input:confirm() {
  while true; do
    case $(input/user "${@:-Continue?} [y/n]") in
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
git:branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# getAbsolutePath
# path/abs - returns the absolute path from ran directory
# usage: path/abs
# examples:
#  path/abs
# returns: "/home/root/Pictures/cats/orange/kittens/"
# * NOTE: returned string starts and ends with "/"
path:abs(){
  [[ -d $1 ]] && { cd "$1"; echo "$(pwd -P)"; } ||
  { cd "$(dirname "$1")"; echo "$(pwd -P)/$(basename "$1")"; }
}

main() {
  echo/success "shell utils loaded!"
}

main
