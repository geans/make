#!/bin/bash

echo 'Criando diretório ~/criar-cpp'
if [ ! -s ~/criar-cpp ]; then
    mkdir ~/criar-cpp
fi
cp -f criar-cpp/* ~/criar-cpp/
chmod +x ~/criar-cpp/criarcpp.sh
echo 'Criando comando criarcpp'
echo 'alias ccpp=~/criar-cpp/criarcpp.sh' >> ~/.bashrc
source ~/.bashrc