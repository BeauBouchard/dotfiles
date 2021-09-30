
# Make sure 256 color terminals are enabled
export TERM=xterm-256color

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# For bash only, so we don't count the lines of non-printed characters. 
# otherwise the line will wrap befor its supposed to over the Prompt
#   - Begin a sequence of non-printing characters. This could be used to embed a terminal control sequence into the prompt.
#   - End a sequence of non-printing characters.

# reset
RESET="\033[0m"           # Text Reset
NC="\e[m"                 # Color Reset

# color variables
BLACK="\033[0;30m"        # Black
RED="\033[0;31m"          # Red
GREEN="\033[0;32m"        # Green
YELLOW="\033[0;33m"       # Yellow
BLUE="\033[0;34m"         # Blue
PURPLE="\033[0;35m"       # Purple
CYAN="\033[0;36m"         # Cyan
WHITE="\033[0;37m"        # White

# bold
BBLACK="\e[1;30m"         # Black
BRED="\e[1;31m"           # Red
BGREEN="\e[1;32m"         # Green
BYELLOW="\e[1;33m"        # Yellow
BBLUE="\e[1;34m"          # Blue
BPURPLE="\e[1;35m"        # Purple
BCYAN="\e[1;36m"          # Cyan
BWHITE="\e[1;37m"         # White

# background
ONBLACK="\e[40m"          # Black
ONRED="\e[41m"            # Red
ONGREEN="\e[42m"          # Green
ONYELLOW="\e[43m"         # Yellow
ONBLUE="\e[44m"           # Blue
ONPURPLE="\e[45m"         # Purple
ONCYAN="\e[46m"           # Cyan
ONWHITE="\e[47m"          # White
