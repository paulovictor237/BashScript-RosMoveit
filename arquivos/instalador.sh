#!/usr/bin/env bash

# Para instalar com o instalador 
# $ bash instalador.sh
# ou
# $ chmod +x instalador.sh
# $ ./instalador.sh

# sudo apt-get install -y whatever
# echo "y" | sudo apt-get install edamame_biscuit

echo "Aguarde a instalação"

cat bashpv.sh >> ~/.bashrc
source ~/.bashrc

echo "Instalação completa"
