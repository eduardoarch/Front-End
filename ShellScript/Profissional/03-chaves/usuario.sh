#!/bin/bash
#	usuario.sh
#
#	Mostra os logins e nomes de usuarios do sistema
#	Obs: Le dados do arquivo /etc/passwd
#
#	Versao 1: Mostra usuarios e nomes separados por TAB
#	Versao 2: Adicionar suporte a opcao -h
#	Versao 3: Adicionado suporte a opcao -V e opcoes invalidas
#	Versao 4: Arrumando bug quando nao tem opcoes, basename no
#			nome do programa, -V extraindo direto dos cabecalhos,
#			adicionadas opcoes --help e --version
#	Versao 5: Adicionadas opcoes -s e --sort
#	Versao 6: Adicionadas opcoes -r, --reverse, -u, --uppercase,
#			leitura de multiplas opcoes (loop)
#	Versao 7: Melhorias no codigo para que fique legivel,
#				adicionadas opcoes -d e --delimiter
#
#
#	Eduardo, Fevereiro de 2024
#

ordenar=0    #	A saida devera ser ordenada?
inverter=0   #	A saida devera ser invertida?
maiusculas=0 #	A saida devera ser em maiusculas?
delim="\t"  #	Caracter usado como delimitador de saida.

MENSAGEM_USO="
Uso: $(basename "$0") [OPCOES]

OPCOES:
	-d, --delimiter C Usa o caracter C como delimitador
	-r, --reverse	Inverter a listagem
	-s, --sort	Ordena a lista alfabeticamente
	-u, --uppercase	Mostra a listagem em MAIUSCULAS

	-h, --help	Mostra esta tela de ajuda
	-V, --version	Mostra a versao do programa
"

#	Tratamento das opcoes de linha de comando
while test -n "$1"; do
	case "$1" in
	-d | --delimiter)
		shift
		delim="$1"

		if test -z "$delim"; then
			echo "Faltou o argumento para a -d"
			exit 1
		fi
		;;
	-s | --sort) ordenar=1 ;;
	-r | --reverse) inverter=1 ;;
	-u | --uppercase) maiusculas=1 ;;
	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
		;;
	-V | --version)
		echo -n $(basename "$0")
		#	Extrai a versao diretamente dos cabecalhos do programa
		grep '^#	Versao ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
		exit 0
		;;
	*)
		if test -n "$1"; then
			echo Opcao invalida: $1
			exit 1
		fi
		;;
	esac

	#	Opcoes $1 ja processada, a fila deve andar
	shift
done

#	Extrair a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

#	Ordena, Inverte ou Converte a listagem (se necessario)
test "$ordenar" = 1 && lista=$(echo "$lista" | sort)
test "$inverter" = 1 && lista=$(echo "$lista" | tac)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z)

#	Mostra o resultado para o usuario
echo "$lista" | tr : "$delim"
