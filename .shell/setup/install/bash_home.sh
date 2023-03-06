#!/usr/bin/env bash

mkdir -p ~/.shell/setup/install/ && \
cd ~/.shell/setup/install && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash.sh ;} && \
source ~/.shell/setup/install/bash.sh && \
echo "source ~/.shell/art/views/home.sh" >> tee ~/.bash_profile  ~/.bashrc && \
echo "display_home_motd" >> tee ~/.bash_profile ~/.bashrc && \
source ~/.shell/setup/install/steam.sh && \ 
source ~/.shell/setup/install/ulauncher.sh && \ 
source ~/.shell/setup/install/nvm.sh && \
source ~/.bashrc && \
echo "setup complete"
