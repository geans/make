#!/bin/bash

DIRETORIO_MODELOS=~/criar-cpp
FONTE_MODELO=$DIRETORIO_MODELOS/modelo.cpp
MAKEFILE_MODELO=$DIRETORIO_MODELOS/modelo.makefile

if [ $# -lt '1' ]; then
    echo "Erro, requer nome como parâmetro."
    echo "Use: ccpp 'nome do programa'"
    exit
fi

echo "Criando diretório"
mkdir $1
cd $1
echo "Criando arquivos de entrada e saída"
touch $1.in $1.out
echo "Criando arquivos fonte modelo"
cp $FONTE_MODELO $1.cpp
echo "Criando Makefile modelo"
sed 's/substituir/'$1'/g' $MAKEFILE_MODELO > Makefile
cd ..