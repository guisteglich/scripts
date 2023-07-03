#!/bin/bash

echo "Iniciando o script de atualização do Linux..."

# Atualiza a lista de pacotes disponíveis
echo "Executando 'apt-get update'..."
sudo apt-get update

# Executa a atualização dos pacotes
echo "Executando 'apt-get upgrade'..."
sudo apt-get upgrade -y

echo "Atualizações concluídas."

# Opcional: Limpa pacotes não utilizados e arquivos antigos
echo "Executando 'apt-get autoremove' e 'apt-get autoclean'..."
sudo apt-get autoremove -y
sudo apt-get autoclean

echo "Limpeza concluída."

# Reinicia o sistema, se necessário
read -p "Deseja reiniciar o sistema agora? (s/n): " choice
if [[ "$choice" =~ ^[Ss]$ ]]; then
    echo "Reiniciando o sistema..."
    sudo reboot
else
    echo "Script concluído."
fi
