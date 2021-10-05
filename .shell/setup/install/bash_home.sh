#!/usr/bin/env bash
rm -Rf ~/.shell/  && \
rm -Rf ~/.shell_helpers && \
mkdir -p ~/.shell/setup/install && \
mkdir -p ~/.shell/art && \
cd ~/.shell && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/utils.sh ;} && \
cd ~/.shell/art && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/art/home.sh ;} && \
cd ~/.shell/setup && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/ps1.sh ;} && \
cd ~/.shell/setup && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/colors.sh ;} && \
cd ~/.shell/setup && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/alias.sh ;} && \
cd ~/.shell/setup/install && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash.sh ;} && \
cd ~/.shell/setup/install && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/nvm.sh ;} && \
cd ~ && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bashrc ;} && \
cd ~ && { curl -O -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bash_profile ;} && \
echo -n "source ~/.shell/art/home.sh" >> ~/.bash_profile && \
echo -n "source ~/.shell/art/home.sh" >> ~/.bashrc && \ 
source ~/.shell/setup/install/nvm.sh
