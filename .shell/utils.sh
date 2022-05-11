#!/usr/bin/env bash


# Number of seconds to wait before printing a reminder
UPDATE_THRESHOLD="86400"
VERSION_GITHUB_URL="https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/VERSION"

readonly DFV=$(<"/.shell/VERSION")

# echo/color - echo color adds a color wrapper then resets
# usage: echo/color <ANSII color code> <message to add color to>
# example:
#   echo/color "\033[0;31m" "THIS MESSAGE IS RED"
echo_color() {
  echo -e "$@${RESET}"
}

echo_blink () {
  echo -ne "${BLINK}$@${RESET}"
}

# echo_color_n - same as color, but has no endline
# usage: echo_color_n <ANSII color code> <message to add color to>
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
  echo_color ${BWHITE}${ONYELLOW}$@${RESET}
}

# echo_alert - echo with red alert color wrapper
# usage: echo/alert <message to add color to>
# example:
#   echo_alert "THIS MESSAGE IS RED"
echo_alert() {
  echo_color ${BWHITE}${ONRED}$@${RESET}
}

# echo_info - echo with a calming blue color wrapper
# usage: eecho_info<message to add color to>
# example:
#   echo_info "THIS MESSAGE IS BLUE"
echo_info() {
  echo_color ${BWHITE}${ONCYAN}$@${RESET}
}

# echo_success - echo with green alert color wrapper
# usage: echo/success <message to add color to>
# example:
#   echo_success "THIS MESSAGE IS GREEN"
echo_success() {
  echo_color ${BWHITE}${ONGREEN}$@${RESET}
}

# input decision for user, useful for assigning variiable values
# usage: prompt_user <prompt message> [fallback value*]
#   * uses fallback/default value if no input recieved
# example:
#   name=$(input_user  "what is your name?")
#   port=$(input_user  "what port for server?" 8080)
input_user() {
  local input=
  # set text prompt value
  local prompt="${1:-value}"
  # set default value
  local default="$2"
  [ -z "$default" ] || prompt+=" [$default]"

  # convert escape sequences in prompt to ansi codes
  prompt="$(echo -en "$prompt : ")"

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

# input_confirm - simple boolean decision to confirm
# usage: input_confirm [message]
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

# git_branch - returns the current git branch for the current environment
# usage: git/branch
# examples:
#  git_branch
# returns: "(main)"
# * Note: branch name is surrouned by "()" in return string
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# for checking email inbox
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

battery_life() {
  if [ -d /sys/class/power_supply/BAT0 ];
  then
      now=`cat /sys/class/power_supply/BAT0/energy_now`
      full=`cat /sys/class/power_supply/BAT0/energy_full`
      out=`echo $now/$full*100 | bc -l | cut -c 1-5`
      printf "%.f%% | " $out
  elif [ -d /sys/class/power_supply/BAT1 ];
  then
      now=`cat /sys/class/power_supply/BAT1/charge_now`
      full=`cat /sys/class/power_supply/BAT1/charge_full`
      out=`echo $now/$full*100 | bc -l | cut -c 1-5`
      printf "%.f%% " $out
  else
      echo "Battery Not Found"
  fi
}

open_connections() {
  awk 'END {print NR}' /proc/net/tcp
}

cpu_percent() {
  case "$OSTYPE" in
    linux-gnu)
    CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))"`
    FREE_MEM=`free | awk '/buffers\/cache/{print (100 - ($4/($3+$4) * 100.0));}'`
    printf "CPU:%.f%% Mem:%.f%%" $CPU $FREE_MEM
    ;;
  esac
}

# runs something once after restart
runonce(){
  if [[ $# -eq 0 ]]; then
    echo "Schedules a command to be run after the next reboot."
    echo "Usage: $(basename $0) <command>"
    echo "       $(basename $0) -p <path> <command>"
    echo "       $(basename $0) -r <command>"
  else
    REMOVE=0
    COMMAND=${!#}
    SCRIPTPATH=$PATH

    while getopts ":r:p:" optionName; do
      case "$optionName" in
        r) REMOVE=1; COMMAND=$OPTARG;;
        p) SCRIPTPATH=$OPTARG;;
      esac
    done

    SCRIPT="${HOME}/.$(basename $0)_$(echo $COMMAND | sed 's/[^a-zA-Z0-9_]/_/g')"

    if [[ ! -f $SCRIPT ]]; then
      echo "PATH=$SCRIPTPATH" >> $SCRIPT
      echo "cd $(pwd)"        >> $SCRIPT
      echo "logger -t $(basename $0) -p local3.info \"COMMAND=$COMMAND ; USER=\$(whoami) ($(logname)) ; PWD=$(pwd) ; PATH=\$PATH\"" >> $SCRIPT
      echo "$COMMAND | logger -t $(basename $0) -p local3.info" >> $SCRIPT
      echo "$0 -r \"$(echo $COMMAND | sed 's/\"/\\\"/g')\""     >> $SCRIPT
      chmod +x $SCRIPT
    fi

    CRONTAB="${HOME}/.$(basename $0)_temp_crontab_$RANDOM"
    ENTRY="@reboot $SCRIPT"

    echo "$(crontab -l 2>/dev/null)" | grep -v "$ENTRY" | grep -v "^# DO NOT EDIT THIS FILE - edit the master and reinstall.$" | grep -v "^# ([^ ]* installed on [^)]*)$" | grep -v "^# (Cron version [^$]*\$[^$]*\$)$" > $CRONTAB

    if [[ $REMOVE -eq 0 ]]; then
      echo "$ENTRY" >> $CRONTAB
    fi

    crontab $CRONTAB
    rm $CRONTAB

    if [[ $REMOVE -ne 0 ]]; then
      rm $SCRIPT
    fi
  fi
}

batz() {
  if [ -z "$battery_life" ]; then 
    echo_warn "  🖥  "
  else
    echo_warn "${battery_life} 🔋"
  fi
}


## Time Based Update Check
update_check_time() {
  [ ! -e $HOME/.last_update ] && touch $HOME/.last_update
  # Initialize for when we have no GNU date available
  last_check=0
  time_now=0

  # Darwin uses BSD, check for gdate, else use date
  if [[ $(uname) = "Darwin" && -n $(which gdate) ]]; then
    last_login=$(gdate -r ~/.last_update +%s)
    time_now=$(gdate +%s)
  else
    # Ensure this is GNU grep
    if [ -n "$(date --version 2> /dev/null | grep GNU)" ]; then
      last_login=$(date -r ~/.last_update +%s)
      time_now=$(date +%s)
    fi
  fi

  time_since_check=$((time_now - last_login))

  if [ "$time_since_check" -ge "$UPDATE_THRESHOLD" ]; then
    echo_alert "$cred==>$cemph Your system is out of date!$cnone"
    echo_alert 'Run `update` to bring it up to date.'
  fi
}

## Checks the version inturnal against a version of the repo on main
update_check_version() {
  INT_VERSION=$(<"/.shell/VERSION")
  EXT_VERSION=$(curl -s $VERSION_GITHUB_URL)
  if [[ $INT_VERSION == $EXT_VERSION]]; then
    echo_success "Your System is up-to-date! Goodjob!"
  else
    echo_alert "Your System is Out-of-Date!"
    echo_alert 'Run `update` to bring it up to date.'
    echo_alert "Remote Version: $INT_VERSION"
    echo_alert "Inturnal Version: $EXT_VERSION"
  fi
}

update_check_version_fix() { 
  INT_VERSION=$(<"/.shell/VERSION")
  EXT_VERSION=$(curl -s $VERSION_GITHUB_URL)
  if [[ $INT_VERSION == $EXT_VERSION]]; then
    echo_success "Your System is up-to-date! Goodjob!"
  else
    echo_alert "Your System is Out-of-Date!"
    echo_alert 'Run `update` to bring it up to date.'
    echo_alert "Remote Version: $INT_VERSION"
    echo_alert "Inturnal Version: $EXT_VERSION"
    echo_info "Updating now..."
    curl -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash.sh | bash
  fi
}
