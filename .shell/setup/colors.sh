
# Make sure 256 color terminals are enabled
export TERM=xterm-256color

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# reset
readonly RESET="\[\033[0m\]"           # Text Reset
readonly NC="\[\e[m\]"                 # Color Reset

# color variables
readonly BLACK="\[\033[0;30m\]"        # Black
readonly RED="\[\033[0;31m\]"          # Red
readonly GREEN="\[\033[0;32m\]"        # Green
readonly YELLOW="\[\033[0;33m\]"       # Yellow
readonly BLUE="\[\033[0;34m\]"         # Blue
readonly PURPLE="\[\033[0;35m\]"       # Purple
readonly CYAN="\[\033[0;36m\]"         # Cyan
readonly WHITE="\[\033[0;37m\]"        # White

# bold
readonly BBLACK="\[\e[1;30m\]"         # Black
readonly BRED="\[\e[1;31m\]"           # Red
readonly BGREEN="\[\e[1;32m\]"         # Green
readonly BYELLOW="\[\e[1;33m\]"        # Yellow
readonly BBLUE="\[\e[1;34m\]"          # Blue
readonly BPURPLE="\[\e[1;35m\]"        # Purple
readonly BCYAN="\[\e[1;36m\]"          # Cyan
readonly BWHITE="\[\e[1;37m\]"         # White

# background
readonly ONBLACK="\[\e[40m\]"          # Black
readonly ONRED="\[\e[41m\]"            # Red
readonly ONGREEN="\[\e[42m\]"          # Green
readonly ONYELLOW="\[\e[43m\]"         # Yellow
readonly ONBLUE="\[\e[44m\]"           # Blue
readonly ONPURPLE="\[\e[45m\]"         # Purple
readonly ONCYAN="\[\e[46m\]"           # Cyan
readonly ONWHITE="\[\e[47m\]"          # White

# just a basic PS1 color scheme
PS1_1="\[\033[38;5;033m\]"
PS1_2="\[\033[38;5;177m\]" # 119
PS1_3="\[\033[38;5;190m\]" # 184
PS1_4="\[\033[38;5;255m\]"
