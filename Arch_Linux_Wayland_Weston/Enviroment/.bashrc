#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Outras configurações do seu .bashrc podem estar aqui...
# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec weston

# Definição de cores
CYAN='\[\033[0;36m\]'
RED='\[\033[0;31m\]'
YELLOW='\[\033[1;33m\]'
NC='\[\033[0m\]' # No Color

# Define custom prompt
export PS1="${CYAN}[\u@\h \W]\$${NC} "

# Funções para imprimir mensagens de erro e atenção
error() {
	    echo -e "${RED}Error:${NC} $*" >&2
    }

    warning() {
	        echo -e "${YELLOW}Attention:${NC} $*" >&2
	}

# Exemplo de uso
#error "This is an error!"
#warning "This is just a warning."
