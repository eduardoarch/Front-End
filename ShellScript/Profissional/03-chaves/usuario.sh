#!/bin/bash
# usuario.sh
#
# Mostra os logins e nomes de usuarios do sistema
# Obs: Le dados do arquivo /etc/passwd
#
# Eduardo, Fevereiro de 2024
#


cut -d : -f 1,5 /etc/passwd | tr : \\t
