#!/usr/bin/env bash
rm -Rf ~/.shell/  && \
rm -Rf ~/.shell_helpers && \
mkdir -p ~/.shell/setup/alias && \
mkdir -p ~/.shell/setup/install && \
cd ~/.shell && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/utils.sh ;} && \
cd ~/.shell/setup && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/ps1.sh ;} && \
cd ~/.shell/setup/alias && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/alias/index.sh ;} && \
cd ~/.shell/setup/install && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash.sh ;} && \
cd ~ && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bashrc ;} && \
cd ~ && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bash_profile ;} && \
. ~/.bash_profile && \
echo_alert "Standard Bash Shell Loaded (${RESET}${BRED}${ONWHITE}${DFV}${BWHITE}${ONRED})"
