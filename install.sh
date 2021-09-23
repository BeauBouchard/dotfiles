echo "starting to take over system..."
cd ~ && mkdir -p ~/.shell/setup/alias
cd ~/.shell/ && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/utils.sh
cd ~/.shell/setup && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/ps1.sh
cd ~/.shell/alias && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell_helpers/setup/alias/index.sh
cd ~ && rm .bash_profile && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bash_profile
clear
source ~/.bash_profile
