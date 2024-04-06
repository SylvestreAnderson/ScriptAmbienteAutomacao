#!/bin/bash

usuario=$(whoami)

echo "Usuário Logado: "$usuario 

echo /home/$usuario/Android 


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
    if [ ! -f /bin/nodejs ]
    then
        echo "Instando o nodejs"
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install nodejs -y
        sudo apt install npm -y
    else 
        echo "Nodejs já instalado na maquina"
    fi
    
}

function java(){
    
    if [ ! -f /bin/java ]
    then
        echo "Iniciando a instalado do Java 19"
        sudo apt install openjdk-19-jre-headless -y
    else
        echo "Java já instalado na maquina"
    fi
}

function python(){
    if [ ! -f /bin/python3 ]
    then
        echo "Instalando o python3"
        sudo apt-get install python3 -y
    else    
        echo "Python 3 já instalado"
    fi

    if [ ! -f /bin/pip3.10  ]
    then
        echo "Instalando o Pip na maquina"    
        sudo apt-get install python3-pip -y
    else
        echo "Pip já instalado na maquina"
    fi        
}

function git(){
    if [ ! -f /bin/git ]
    then
        echo "Instalando o git na maquina"
        sudo apt install git -y
    else
        echo "Git já instalado na maquina"
    fi        
}

function andoridStudio() {

    if [ ! -d /home/$usuario/Android ]
    then
        echo "Instalando o Android Studio"
        sudo apt-get update 
        sudo snap install android-studio --classic -y
        sudo add-apt-repository ppa:maarten-fonville/android-studio -y
        sudo apt-get update
        sudo apt install android-studio -y  
        #documentation: https://www.educative.io/answers/how-to-install-android-studio-in-ubuntu 
    else
        echo "Android Studio Já instalado na maquina"
    fi
    
}

criandoPastaInstalacao
vsCode
nodejs
java
python
git
andoridStudio


