#!/bin/bash
#
# seq.sh - Emula��o do comando seq em Bash, por Aur�lio M. Jargas
#
# O comando seq recebe dois n�meros e mostra na sa�da padr�o todos os n�meros
# existentes entre eles, inclusive. Essa seq��ncia est� pronta para ser usada
# pelo comando FOR. Caso omitido o n�mero inicial, � utilizado o 1.
#
#       Exemplo 1            Exemplo 2            Exemplo 3
#
#        $ seq 5 10          $ seq 10 5           $ seq 5
#        5                   10                   1
#        6                   9                    2
#        7                   8                    3
#        8                   7                    4
#        9                   6                    5
#        10                  5
#
# Uso em scripts: for i in $(seq 5 10); do comandos ; done
#
o=+ a=1 z=${1:-1}; [ "$2" ] && { a=$1; z=$2; } ; [ $a -gt $z ] && o=-
while [ $a -ne $z ]; do echo $a ; eval "a=\$((a $o 1))"; done; echo $a