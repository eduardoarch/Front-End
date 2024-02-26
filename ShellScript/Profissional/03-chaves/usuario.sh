#!/bin/bash
# usuario.sh
#
# Mostra os logins e nomes de usuarios do sistema
# Obs: Le dados do arquivo /etc/passwd
#
# Versao 1: Mostra usuarios e nomes separados por TAB
# Versao 2: Adicionar suporte a opcao -h
#
# Eduardo, Fevereiro de 2024
#

MENSAGEM_USO="
Uso: $0 [-h]

-h Mostra esta tela de ajuda

"

# Tratamento das opcoes de linha de comando
if test "$1" = "-h"
then
    echo "$MENSAGEM_USO"
    exit 0
fi

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
