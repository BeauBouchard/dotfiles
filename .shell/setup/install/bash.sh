#!/usr/bin/env bash
echo "starting to take over system..." && \
echo $PWD && \
rm -Rf ~/.shell/  && \
rm -Rf ~/.shell_helpers && \
mkdir -p ~/.shell/setup/alias && \
cd ~/.shell && { curl -O https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/utils.sh ; cd -; } && \
. ~/.shell/utils.sh && \
cd ~/.shell/setup && { curl -O https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/ps1.sh ; cd -; } && \
cd ~/.shell/setup/alias && { curl -O https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/alias/index.sh ; cd -; } && \
cd ~ && { curl -O https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bashrc  ; cd -; } && \
cd ~ && { curl -O https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bash_profile  ; cd -; } && \
.. ~/.bash_profile 
