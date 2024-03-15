#!/bin/bash
#   getopts-teste.sh
#
#   Eduardo, Marco de 2024

#   Loop que processa todas as opcoes da linha de comando.
#   Atencao ao formato das opcoes validasa ":sa:"
#   - Os dois-pontos do inicio liga o modo silencioso
#   - As opcoes validas sao 'sa:', que sao -s e -a
#   - Os dois-pontos de 'a:' representam um argumento: -a FOO
#
while getopts ":sa:" opcao; do
    #   $opcao guarda a opcao davez (ou ? e : em caso de erro)
    #   $OPTARG guarda o argumento da opcao (se houver)
    #
    case $opcao in
    S) echo "OK Opcao simples (-s)" ;;
    a) echo "OK Opcao com argumento (-a), recebeu: $OPTARG" ;;
    \?) echo "ERRO Opcao com argumento invalida: $OPTARG" ;;
    :) echo "ERRO Faltou argumento para: $OPTARG" ;;
    esac
done
