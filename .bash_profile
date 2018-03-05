## Beau Bouchard 
## .bash_profile

# Git branch in prompt

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# wallpaper is to change the current wallpaper to an image on mac only
# great for scripting download of wallpaper and automating changing it. 
wallpaper() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

# getting abspath on mac, which i use for the wallpaper function
getAbsolutePath(){
    [[ -d $1 ]] && { cd "$1"; echo "$(pwd -P)"; } ||
    { cd "$(dirname "$1")"; echo "$(pwd -P)/$(basename "$1")"; }
}

# Runs something once after restart
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


# Other Exports


## Aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias ..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"
alias ps="ps auxf"
alias jf="ps -ef"

# CD Project base home
alias cdh="cd ~/Projects/"

alias gc="git checkout"
alias gcb="git checkout -b"
alias gf="git fetch"
alias gp="git pull"
alias gs="git status"
alias gpo="git push origin"
alias addall="git add -A"
alias commitit="git commit -am"
alias pushit="git push origin head"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"


# Make sure 256 color terminals are enabled
export TERM=xterm-256color

# PS1
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
