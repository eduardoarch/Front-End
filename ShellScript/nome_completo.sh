#!/bin/bash
#
# nome_completo.sh - Busca o nome completo de usuário no unix
#
#
# Site       : http://programas.com.br/nomecompleto/
# Autor      : Eduardo Rosa <NeonComputerArt@outlook.com>
# Manutenção : Santos <NeonComputerArt@outlook.com>
# 
# 
# ------------------------------------------------------------
# Este programa recebe como parâmetro o login de usuário e 
# procura em várias bases qual o seu nome completo, retornando 
# o resultado na saída padrão (STDOUT)
# 
# 
# Exemplos:
#   $ ./nome_completo.sh jose
#   José Moreira
#   
#   $ ./nome_completo.sh joseee
#   $
# 
# A ordem de procura do nome completo é sequencial:
# 
#   1. Arquivo /etc/passwd
#   2. Arquivo $HOME/.plan
#   3. Base de Usuários LDAP
#   4. Base de Usuários MySQL
#   
# Respeitando a ordem, o primeiro resultado encontrado será  
# o retornado
# 
# ------------------------------------------------------------
# 
# 
# Histórico:
# 
# v1.0 2019-05-18, Eduardo rosa:
#   - Versão inicial procurando no /etc/passwd
# v1.1 2019-08-02, Santos Rosa:
#   - Adicionada pesquisa no $HOME/.plan
#   - Corrigido bug com nomes acentuados
# v2.0 2020-04-28, Antonio Alves:
#   - Corrigidos 2.534 bugs (O Eduardo não sabe programar!)
#   - Adicionado meu nome em vários lugares hehehe
# v2.1 2020-04-30, Wesley Anum:
#   - Desfeitas as "correções" do Antonio (ele quebrou o programa)
#   - Retirada a frase "Antonio é o maior" de várias partes
# v2.2 2020-05-02, Eduardo Rosa:
#   - Adicionando suporte a LDAP (que trabaheira)
#   - Aceita nomes de usuários EM MAIÚCULAS
#   - Retirado suporte a acentuação (estraga meu terminal)
# v2.3 2020-05-03, Eduardo Rosa:
#   - Arrumando o suporte a LDAP (agora vai funcionar)
# v2.4 2020-05-04, Eduardo Rosa:
#   - Retirando o suporte a LDAP (eu odeio LDAP)
# v3.0 2020-05-10, Antonio Alves:
#   - Programa reescrito do zero
#   - Adicionado suporte a LDAP (funcional)
#   - Adicionado o suporte a MySQL
#   - Restaurado suporte a acentuação
# v3.1 2023-05-10, Wesley Anum:
#   - Adicionado este comentário para comemorar 3 anos 
# sem alterações :)
# 
# 
# Licença:GPL
# 
