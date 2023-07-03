#!/bin/bash

# Atualizar os repositórios e pacotes existentes
sudo apt update

# Instalar o Git
sudo apt install git -y

# Instalar o Docker
sudo apt install docker.io -y

# Adicionar o usuário atual ao grupo "docker" para executar comandos Docker sem "sudo"
sudo usermod -aG docker $USER

# Instalar o Docker Compose
sudo apt install docker-compose -y

# Instalar o Node.js (versão LTS)
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs -y

# Instalar o npm (gerenciador de pacotes do Node.js)
sudo apt install npm -y

# Instalar o Visual Studio Code (VS Code)
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code -y

# Instalar o Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f -y

# Instalar o Spotify
sudo snap install spotify

# Instalar o Insomnia (substituto do Postman)
sudo snap install insomnia

# Informar que o script foi concluído
echo "Instalação concluída!"


