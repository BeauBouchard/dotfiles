#!/usr/bin/env bash
rm -Rf ~/.shell/  && \
rm -Rf ~/.shell_helpers && \
mkdir -p ~/.shell/setup/alias && \
cd ~/.shell && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/utils.sh ;} && \
cd ~/.shell/setup && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/ps1.sh ;} && \
cd ~/.shell/setup/alias && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/alias/index.sh ;} && \
cd ~ && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bashrc ;} && \
cd ~ && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bash_profile ;} && \
. ~/.bash_profile && \
echo_alert "Standard Bash Shell Loaded" & sleep 1 ;  && \
echo_warn "ReWrite Kernel?" & sleep 1 ; && \
echo_color_n ${BWHITE}${ONGREEN}[Y]{BWHITE$}{ONBLACK}[N]  & sleep 1 ; 
busy & sleep 5 ; kill $!
