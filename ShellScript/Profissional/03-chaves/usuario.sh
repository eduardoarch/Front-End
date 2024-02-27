#!/bin/bash
# usuario.sh
#
# Mostra os logins e nomes de usuarios do sistema
# Obs: Le dados do arquivo /etc/passwd
#
# Versao 1: Mostra usuarios e nomes separados por TAB
# Versao 2: Adicionar suporte a opcao -h
# Versao 3: Adicionado suporte a opcao -V e opcoes ivalidas
#
# Eduardo, Fevereiro de 2024
#

MENSAGEM_USO="
Uso: $0 [-h|-V]

-h Mostra esta tela de ajuda
-V Mostra a versao do programa
"

# Tratamento das opcoes de linha de comando
case "$1" in
    -h)
	echo "$MENSAGEM_USO"
	exit 0
	;;
    -V)
	echo $0 Versao 3
        exit 0
	;;
    *)
	echo Opcao Invalida:$1
	exit 1
	;;
esac
    
# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
