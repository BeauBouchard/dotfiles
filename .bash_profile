## Beau Bouchard
## .bash_profile

source ./.shell_helpers/utils.sh

# Other Exports

## Aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias ..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"

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
export PS1="\[\033[38;5;033m\]\u\[\033[0m\]@\[\033[38;5;119m\]\h\[\033[0m\]:\[\033[38;5;184m\]\w\[\033[0m\]\[\033[38;5;255m\]\$(parse_git_branch)\$\[\033[0m\]: "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
