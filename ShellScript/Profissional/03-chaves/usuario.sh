#!/bin/bash
# usuario.sh
#
# Mostra os logins e nomes de usuarios do sistema
# Obs: Le dados do arquivo /etc/passwd
#
# Versao 1: Mostra usuarios e nomes separados por TAB
# Versao 2: Adicionar suporte a opcao -h
# Versao 3: Adicionado suporte a opcao -V e opcoes invalidas
# Versao 4: Arrumando bug quando nao tem opcoes, basename no
#			nome do programa, -V extraindo direto dos cabecalhos,
#			adicionadas opcoes --help e --version
#
#
# Eduardo, Fevereiro de 2024
#

MENSAGEM_USO="
Uso: $0 [-h|-V]

-h, --help	Mostra esta tela de ajuda
-V, --version	Mostra a versao do programa
"

# Tratamento das opcoes de linha de comando
case "$1" in
-h | --help)
	echo "$MENSAGEM_USO"
	exit 0
	;;
-V | --version)
	echo -n $(basename "$0")
	# Extrai a versao diretamente dos cabecalhos do programa
	grep '^# Versao ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
	exit 0
	;;
*)
	if test -n "$1"; then
		echo Opcao invalida: $1
		exit 1
	fi
	;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
