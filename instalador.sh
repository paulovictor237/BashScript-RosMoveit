#!/usr/bin/env bash

# Para instalar com o instalador 
# $ bash instalador.sh
# ou
# $ chmod +x instalador.sh
# $ ./instalador.sh

echo "Aguarde a instalação"

cat bashpv.sh >> ~/.bashrc
source ~/.bashrc

echo "Instalação completa"