#!/usr/bin/env bash
mkdir -p ~/.shell/setup/install/ && \
cd ~/.shell/setup/install && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash.sh ;} && \
source ~/.shell/setup/install/bash.sh && \
echo "source ~/.shell/art/bee.sh" >> ~/.bash_profile && \
echo "source ~/.shell/art/bee.sh" >> ~/.bashrc && \ 
source ~/.shell/setup/install/nvm.sh
