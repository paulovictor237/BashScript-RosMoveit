#!/usr/bin/env bash

# ------------------------------------------
# | Para instalar com o instalador 
# | $ bash instalador.sh
# | ou
# | $ chmod +x instalador.sh
# | $ ./instalador.sh
# | 
# | sudo apt-get install -y
# | echo "y" | sudo apt-get install snapd
# ------------------------------------------

echo "Aguarde a instalação"

# install snap
sudo apt update
sudo apt install snapd -y
source ~/.bashrc 
# install typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora -y
# Spotify
sudo snap install spotify
# GitKraken
sudo snap install gitkraken --classic
# vs code
#sudo apt install code -y
sudo snap install code --classic
# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
# insync
#sudo apt install insync -y

echo "Instalação completa"

exit 1
