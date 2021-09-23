echo "starting to take over system..."
echo $PWD
rm -Rf ~/.shell/ 
rm ~/.bash_profile
rm -Rf ~/.shell_helpers
cd ~ && mkdir -p ~/.shell/setup/alias
cd ~/.shell/ && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/utils.sh
cd ~/.shell/setup && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/ps1.sh
cd ~/.shell/alias && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell_helpers/setup/alias/index.sh
cd ~ && rm .bash_profile && wget https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.bash_profile

. ~/.bash_profile
