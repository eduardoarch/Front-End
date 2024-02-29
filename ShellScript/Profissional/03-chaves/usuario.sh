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
# Versao 5: Adiciionadas opcoes -s e --sort
#
# Eduardo, Fevereiro de 2024
#

ordenar=0 # A saida devera ser ordenada?

MENSAGEM_USO="
Uso: $0 [-h|-V |-s]

-s, --sort	Ordena a lista alfabeticamente
-h, --help	Mostra esta tela de ajuda
-V, --version	Mostra a versao do programa
"

# Tratamento das opcoes de linha de comando
case "$1" in

-s | --sort)
	ordenar=1
	;;
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

# Extrair a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena a listagem (se necessario)
if test "$ordenar" = 1; then
	lista=$(echo "$lista" | sort)
fi

# Mostra o resultado para o usuario
echo "$lista" | tr : \\t
