#!/bin/bash
#   usuario-getopts.sh
#
#   Mostra os logins e os nomes de usuarios do sistema
#   Obs.: Le dados do arquivo /etc/passwd
#
#   Versao 1: Mostra usuarios e nomes separados por TAB
#   Versao 2: Adicionado suporte a opcao -h
#   Versao 3: Adicionado suporte a opcao -V e opcoes invalidas
#   Versao 4: Arrumando bug quando nao tem opcoes, basemane
#               nome do programa, -V extraindo direto dos cabecalhos,
#               adicionado a opcao --help e --version
#   Versao 5: Adicionado opcoes -s e --sort
#   Versao 6: Adicionado opcoes -r, --reverse, -u, --uppercase,
#               leitura de multiplas opcoes (loop)
#   Versao 7: Melhorias no codigo para que fique mais legivel,
#               adicionado opcoes -d e --delimiter
#   Versao 7g: Modificado para usar o getopts
#
#   Eduardo, Marco de 2024
#

ordenar=0   # A saida devera ser ordenada?
inverte=0   # A saida devera ser revertida?
maiuscula=0 # A saida devera ser maiuscula?
delim='\t'  # Caracter usado como delimitador de saida

MENSAGEM_USO="
Uso: $(basename "$0")[OPCOES]

OPCOES:
-dC Usa o caracter C como delimitador
-r  Inverter a listagem 
-s  Ordena a listagem alfabeticamente
-u  Mostra a listagem em MAIUSCULAS
-h  Mostra essa tela de ajuda e sai
-V  Mostra a versao do programa e sai
"

#   Tratamento das opcoes da linha de comando
while getopts ":hVd:rsu" opcao; do
    case "$opcao" in
    esac
done
