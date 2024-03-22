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


    if [ ! -f /bin/code ];
    then
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
     
    else
        echo "vsCode já instalado"
    fi
}

function nodejs(){
    echo "Instando o nodejs"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install nodejs -y
    sudo apt install npm -y
}

criandoPastaInstalacao
vsCode
nodejs

