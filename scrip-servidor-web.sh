#!bin/bash

#usando o 'echo' para informar o procedimento de "atualização do servidor"

echo "Atualizando servidor WEB."

#Modo de configuração direta mais não definitiva
setxkbmap -model abnt2 -layout br

#Antes de baixar alguns programas fazer update e upgrade do servidor
#(-y) para fazer as confirmações automaticas
apt-get update
apt-get upgrade -y

#Verificação de versão, instalação servidor WEB 

apt-get search apache2
apt-get install apache2

#Verificação e instalação unzip

apt-get search unzip
apt-get install unzip

#usando o 'echo' para informar copia dos arquivos a serem aplicados"

echo "Baixando e copiando arquivos da aplicação."

#Entrar no diretório /tmp

cd /tmp

#Verificar instalação 'wget', usar o wget para baixar link zipado do github 

apt-get install wget

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

#Tirando o zip

unzip main.zip

#Entrar na pasta desompactada e copiar para local do servidor WEB(Apache2)

cd linux-site-dio-main
cp -R * /var/www/html/

#Fornecendo ao script permissão para execução

chmod +x script-servidor-web.sh 


#Em caso de surgimento de erro de bin/bash "bin/bash: bad interpreter: no such or directory"

bash script-serdor-web.sh

#restart o servidor

reboot

#verificar o status do devidor WEB(apache2)

systemctl status apache2

#Verificar se está rodando normalmente o site, usar browser colocando o ip referente ao servidor apache2(WEB). 

