
# Number of seconds to wait before printing a reminder
UPDATE_THRESHOLD="86400"

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

update_check_version() {
  INT_VERSION=$(<"/.shell/VERSION")
  # we will need to update this later, but for right now and testing its fine. 
  EXT_VERSION=$(curl -s "https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/VERSION")
  if [[ ]]; then
    echo_alert "Your System is Out-of-Date!"
    echo_alert 'Run `update` to bring it up to date.'
  else
    echo_success "Your System is up-to-date! Goodjob!
  fi
}
