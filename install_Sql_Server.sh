#!/bin/bash

echo "Baixando a chave pública, converta-a do formato ASCII em GPG e grave-a no local desejado"

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

echo "Se você receber um aviso sobre a chave pública não estar disponível, você pode usar o seguinte comando em seu lugar:"

curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc

echo "Baixe e registre manualmente o repositório Ubuntu do SQL Server:"

curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list

echo "Atualizando os repositorios"
sudo apt-get update
echo "Instalando o SLQ Server"
sudo apt-get install -y mssql-server

echo "Instalação concluida"
