#!/bin/bash
#(Ilton Jr - 17072015)
#
## --->> Pega Dump Somente de Tabela << ----
# 
# ------------------------------------------------------------------------------------------------------------------------------------------
#      OBS: Esse script auxilia para fazer dump de uma tabela em qualquer servidor postgres
#      OBS: É Necessário ter acesso ao banco via rede e via pg_hba.conf
# ------------------------------------------------------------------------------------------------------------------------------------------
#

DATA=$(date +%d%m%Y)
echo ""
echo "-----------------------------------------------------------------------------"
echo -e "\033[33;1mScript para pegar dump de tabela em Servidor PostgreSQL\033[m"
echo "-----------------------------------------------------------------------------"
echo ""
echo "-----------------------------------------------------------------------------"
echo -e "Insira o IP do servidor que deseja fazer o Dump \nIP: "
read IP
echo ""

echo "-----------------------------------------------------------------------------"
echo -e "Insira o database que você deseja fazer o dump \nDatabase: "
read DATABASE
echo ""

echo "-----------------------------------------------------------------------------"
echo -e "Insira o nome do Schema \nSchema: "
read SCHEMA
echo ""

echo "-----------------------------------------------------------------------------"
echo -e "Insira o nome da Tabela \nTabela: "
read TABELA
echo ""

echo "-----------------------------------------------------------------------------"
echo -e "Insira o Nome de Usuário que deseja utilizar \nUser: "
read USUARIO
echo ""

echo "---------------------------------------------------------------------------------"
echo "O seguinte comando será executado, coloque a senha do usuário quando solicitado!"
echo "---------------------------------------------------------------------------------"
echo -e "\e[33;1m pg_dump -h $IP -t $SCHEMA"."$TABELA $DATABASE -U $USUARIO > $SCHEMA"_"$TABELA"_"$DATA.sql \e[m"
echo "---------------------------------------------------------------------------------"
echo ""

echo "O Schema será salvo no Diretório:`pwd`, Deseja Continuar?? (yes/no)"
read CONDI
echo ""

if [ "$CONDI" = 'yes' ]
then
	echo "Fazendo Dump, Aguarde ..."
elif [ "$CONDI" = 'no' ]
then
	echo -e "\e[31;1m Você Optou por não Continuar.. Tchau :/ \e[m"
else 
	echo -e "\e[31;5m Comando Inválido ... \e[m"
	exit
fi

pg_dump -h $IP -t $SCHEMA"."$TABELA -d $DATABASE -U $USUARIO > $SCHEMA"_"$TABELA"_"$DATA.sql

echo ""
echo "Concluido!!"
ls -1 $SCHEMA"_"$TABELA"_"$DATA.sql
