Lista de comandos básicos mais utilizados ao trabalhar com versionamento em Git
git config: Este é o primeiro comando a ser executado após instalar o Git. Ele possibilita configurar seu nome e endereço de email que ficará vinculado às alterações.
$ git config --global user.name "Nome do usuário"
$ git config --global user.email "seu@email.com"

git init: Inicia ou cria um repositório.
$ git init

git status: Permite visualizar o estado do repositório.
$ git status

git add: Prepara o conteúdo para o próximo commit.
$ git add nome_do_arquivo
$ git add .

git commit: Salva o conteúdo atual junto com uma mensagem de registro do usuário que descreve as alterações.
$ git commit -m "Mensagem descritiva do commit"

git clone: Clona um repositório existente.
$ git clone [url]
git branch: Uma branch nada mais é do que uma ramificação dentro do repositório. Este comando pode ser utilizado de diversas maneiras.
$ git branch // Mostra as branches existentes em um repositório
$ git branch nome_da_branch // Cria uma nova branch
$ git branch -M nome_da_branch // Renomeia a branch atual

git log: Exibe um histórico de commits. Este comando pode ser utilizado de diversas formas.
$ git log
$ git log --oneline

git remote: Exibe o repositório remoto.
$ git remote
$ git remote -v

git pull: Baixa o conteúdo do repositório remoto, atualizando automaticamente o repositório local.
$ git pull

git push: Envia o conteúdo do repositório local, atualizando automaticamente o repositório remoto.
$ git push

Gerar uma nova chave SSH
Você pode gerar uma nova chave SSH no computador local. Após gerar a chave, você poderá adicionar a chave pública à sua conta em GitHub.com para habilitar a autenticação para operações Git por SSH.

Abra Terminal.
Cole o texto abaixo, substituindo o endereço de e-mail pelo seu GitHub.
ssh-keygen -t ed25519 -C "your_email@example.com"

Isto cria uma nova chave SSH, usando o nome de e-mail fornecido como uma etiqueta.
> Generating public/private ALGORITHM key pair.
> Enter a file in which to save the key (/home/YOU/.ssh/ALGORITHM):[Press enter]
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]

Adicionar sua chave SSH ao ssh-agent
Inicie o ssh-agent em segundo plano.
$ eval "$(ssh-agent -s)"
> Agent pid 59566

Dependendo do seu ambiente, talvez seja necessário usar um comando diferente. Por exemplo, talvez seja necessário usar o acesso raiz executando sudo -s -H antes de iniciar o ssh-agent ou usar exec ssh-agent bash ou exec ssh-agent zsh para executar o ssh-agent.
Adicione sua chave SSH privada ao ssh-agent. Se você criou sua chave com um nome diferente ou está adicionando uma chave existente que tenha outro nome, substitua id_ed25519 no comando pelo nome do arquivo de chave privada.
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
-----------------------------------------------------------------------------------------------------------------------------------------------------
