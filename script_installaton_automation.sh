#!/bin/bash

usuario=$(whoami)

echo "Usuário Logado: "$usuario 


function criandoPastaInstalacao(){
        
    if [ -d /home/$usuario/Documentos/Automacao ];
    then 
        echo "A pasta de instalação existente"
    else
        echo "Criando a pasta de instalação com o nome Automação"
        cd /home/$usuario/Documentos
        mkdir Automacao
    fi
        
    
}

function vsCode(){
    if [ -d /home/$usuario/Documentos/Automacao/code_1.87.2-1709912201_amd64.deb ];
    then 
        echo "A instalação do VsCode já instalado!"
    else
        #https://code.visualstudio.com/docs/setup/linux
        echo "Iniciando a instalação do VsCode"
        cd /home/$usuario/Documentos/Automacao
        sudo apt-get install wget gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg
        sudo apt install apt-transport-https -y
        sudo apt update -y
        sudo apt install code -y
    fi
}

criandoPastaInstalacao
vsCode


