#!/bin/bash

# Iniciar e popular as chaves do pacman
pacman-key --init
pacman-key --populate archlinux

# Poderes de super usuário
# Mais informações em: https://wiki.archlinux.org/title/Sudo_(Portugu%C3%AAs)
# Isso precisa ser feito como root
EDITOR=vim visudo
# Descomente a linha abaixo para permitir que os usuários do grupo "wheel" usem o sudo
# %wheel      ALL=(ALL) ALL

# Desabilitar watchdog
# Mais informações em: https://wiki.archlinux.org/title/Improving_performance_(Portugu%C3%AAs)
# Adicione 'nowatchdog' aos parâmetros de inicialização do kernel
# Edite o arquivo /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet nowatchdog ..."
# sudo grub-mkconfig -o /boot/grub/grub.cfg
# Reinicie

# Criar os arquivos
echo "kernel.nmi_watchdog = 0" | sudo tee /etc/sysctl.d/disable_watchdog.conf
echo "blacklist iTCO_wdt" | sudo tee /etc/modprobe.d/watchdog.conf
echo "blacklist iTCO_vendor_support" | sudo tee -a /etc/modprobe.d/watchdog.conf
echo "blacklist sp5100_tco" | sudo tee -a /etc/modprobe.d/watchdog.conf

#!/bin/bash

# Edite o arquivo de configuração TLP
sudo vim /etc/tlp.conf

# Inicie o serviço TLP
sudo tlp start

# Inicie o serviço TLP no boot
sudo systemctl start tlp.service
sudo systemctl enable tlp.service

# Desative o serviço systemd-rfkill
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# Execute o comando tlp-stat com várias opções
sudo tlp-stat -s -t -b -c -d -e -g -p -r -s -u -w -v

# Instale ethtool para desativar o Wake-on-LAN
# sudo pacman -S ethtool

# Instale smartmontools para informações de saúde do disco
# sudo pacman -S smartmontools

#!/bin/bash

#https://aur.archlinux.org/cgit/aur.git/tree/zram-generator.install?h=zram-generator-git
#https://aur.archlinux.org/cgit/aur.git/tree/half-memory.conf.example?h=zram-generator-git

# Instalar e configurar ZRAM
sudo pacman -S zram-generator

# Encontre o arquivo de configuração de exemplo
example_config=$(find / -name "zram-generator.conf.example")

# Copie o exemplo de configuração para o diretório de configuração do systemd
sudo cp "$example_config" /etc/systemd/zram-generator.conf

# Edite o arquivo de configuração usando o Vim (ou o editor de sua preferência)
sudo vim /etc/systemd/zram-generator.conf

# Reinicie o serviço systemd para aplicar as alterações
sudo systemctl daemon-reload

echo "Configuração do ZRAM concluída.
(
[zram0]
# This section describes the settings for /dev/zram0.
#
# The maximum amount of memory (in MiB). If the machine has more RAM
# than this, zram device will not be created.
#
# The default is 2048 MiB, i.e. the device is only created on machines
# with limited memory.
#
# "host-memory-limit = none" may be used to disable this limit.
host-memory-limit = none

# The fraction of memory to use as ZRAM. For example, if the machine
# has 1 GiB, and zram-fraction=0.25, then the zram device will have
# 256 MiB. Values in the range 0.10–0.40 are recommended.
#
# The default is 0.25.
zram-fraction = 0.5

# The maximum size of the zram device (in MiB).
#
# If host-memory times zram-fraction is greater than this,
# the size will be capped to this amount;
# for example, on a machine with 2 GiB of RAM and with zram-fraction=0.5,
# the device would still be 512 MiB in size due to the limit below.
#
# The default is 4096.
max-zram-size = none

# The compression algorithm to use for the zram device,
# or leave unspecified for your distribution's default.
compression-algorithm = lzo-rle
)"

# Atualizar as unidades do sistema
systemctl daemon-reload

# Habilitar zram como swap
systemctl start /dev/zram0

# Lembre-se de reiniciar o sistema após a execução deste script para que as alterações tenham efeito.

#!/bin/bash

# Disabling the PC speaker
# Saiba mais em: https://wiki.archlinux.org/title/PC_speaker#Beep

# Remova o módulo do kernel para desativar o alto-falante do PC
rmmod pcspkr

# Crie um arquivo de configuração para evitar o carregamento do módulo do kernel
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf

# Recarregue a configuração do módulo do kernel
sudo update-initramfs -u

# Reinicie para aplicar as alterações
sudo reboot





[eduardo@archlinux ~]$ yay -S libva-intel-driver-hybrid
AUR Explicit (1): libva-intel-driver-hybrid-2.4.1-2
Sync Make Dependency (1): meson-1.2.1-1
:: (1/1) PKGBUILD transferido: libva-intel-driver-hybrid
  1 libva-intel-driver-hybrid        (Arquivos de Build Existem)
==> Limpar e construir quais pacotes?
==> [N]Nenhum [A]Todos [Ab]Abortar [I]Instalados [No]Não Instalados ou (1 2 3, 1-3, ^4)
==> N
  1 libva-intel-driver-hybrid        (Arquivos de Build Existem)
==> Exibir Diffs?
==> [N]Nenhum [A]Todos [Ab]Abortar [I]Instalados [No]Não Instalados ou (1 2 3, 1-3, ^4)
==> N
==> Criando o pacote: libva-intel-driver-hybrid 2.4.1-2 (ter 12 set 2023 09:52:07)
==> Obtendo fontes...
  -> Clonando repositório intel-vaapi-driver do tipo git...
Cloning into bare repository '/home/eduardo/.cache/yay/libva-intel-driver-hybrid/intel-vaapi-driver'...
remote: Enumerating objects: 17044, done.
remote: Counting objects: 100% (74/74), done.
remote: Compressing objects: 100% (44/44), done.
remote: Total 17044 (delta 45), reused 43 (delta 30), pack-reused 16970
Receiving objects: 100% (17044/17044), 8.81 MiB | 3.48 MiB/s, done.
Resolving deltas: 100% (13311/13311), done.
==> ATENÇÃO: Ignorando verificação de assinaturas PGP de arquivo fonte.
==> Validando source arquivos com sha256sums...
    intel-vaapi-driver ... Ignorada
:: Remover dependências make após a instalação? [s/N] 
:: (1/1) Analisando SRCINFO: libva-intel-driver-hybrid
[sudo] senha para eduardo: 
Sinto muito, tente novamente.
[sudo] senha para eduardo: 
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (4) ninja-1.11.1-3  python-tqdm-4.66.1-2  python-typing_extensions-4.7.1-1  meson-1.2.1-1

Tamanho total download:    2,33 MiB
Tamanho total instalado:  14,46 MiB

:: Continuar a instalação? [S/n] 
:: Obtendo pacotes...
 python-typing_extensions-4.7.1-1-any    67,5 KiB  33,9 KiB/s 00:02 [-------------------------------------] 100%
 python-tqdm-4.66.1-2-any               132,5 KiB  59,3 KiB/s 00:02 [-------------------------------------] 100%
 ninja-1.11.1-3-x86_64                  145,4 KiB  64,3 KiB/s 00:02 [-------------------------------------] 100%
 meson-1.2.1-1-any                     2037,3 KiB   530 KiB/s 00:04 [-------------------------------------] 100%
 Total (4/4)                              2,3 MiB   562 KiB/s 00:04 [-------------------------------------] 100%
(4/4) verificando chaves no chaveiro                                [-------------------------------------] 100%
(4/4) verificando integridade do pacote                             [-------------------------------------] 100%
(4/4) carregando arquivos do pacote                                 [-------------------------------------] 100%
(4/4) verificando conflitos de arquivos                             [-------------------------------------] 100%
(4/4) verificando espaço em disco disponível                        [-------------------------------------] 100%
:: Processando alterações do pacote...
(1/4) instalando ninja                                              [-------------------------------------] 100%
(2/4) instalando python-tqdm                                        [-------------------------------------] 100%
Dependências opcionais para python-tqdm
    python-requests: telegram
(3/4) instalando python-typing_extensions                           [-------------------------------------] 100%
(4/4) instalando meson                                              [-------------------------------------] 100%
:: Executando hooks pós-transação...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Configure symlinks in /usr/local/bin based on firecfg.config...
==> Criando o pacote: libva-intel-driver-hybrid 2.4.1-2 (ter 12 set 2023 09:52:54)
==> Verificando as dependências de tempo de execução...
==> Verificando as dependências de tempo de compilação...
==> Obtendo fontes...
  -> Atualizando repositório intel-vaapi-driver do tipo git...
==> Validando source arquivos com sha256sums...
    intel-vaapi-driver ... Ignorada
==> Removendo diretório $srcdir/ existente...
==> Extraindo fontes...
  -> Criando cópia de trabalho do repositório intel-vaapi-driver do tipo git...
Cloning into 'intel-vaapi-driver'...
done.
Switched to a new branch 'makepkg'
==> Iniciando prepare()...
==> Iniciando pkgver()...
==> Os fontes estão prontos.
==> Criando o pacote: libva-intel-driver-hybrid 2.4.1-2 (ter 12 set 2023 09:52:58)
==> Verificando as dependências de tempo de execução...
==> Verificando as dependências de tempo de compilação...
==> ATENÇÃO: Usando a árvore do $srcdir/ existente
==> Iniciando pkgver()...
==> Iniciando build()...
+ exec meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype plain --auto-features enabled --wrap-mode nodownload -D b_lto=true -D b_pie=true -D python.bytecompile=1 -Denable_hybrid_codec=true intel-vaapi-driver build
The Meson build system
Version: 1.2.1
Source dir: /home/eduardo/.cache/yay/libva-intel-driver-hybrid/src/intel-vaapi-driver
Build dir: /home/eduardo/.cache/yay/libva-intel-driver-hybrid/src/build
Build type: native build
Project name: intel-vaapi-driver
Project version: 2.4.1.0
C compiler for the host machine: cc (gcc 13.2.1 "cc (GCC) 13.2.1 20230801")
C linker for the host machine: cc ld.bfd 2.41.0
Host machine cpu family: x86_64
Host machine cpu: x86_64
Library dl found: YES
Library m found: YES
Program git found: YES (/usr/bin/git)
Run-time dependency threads found: YES
Found pkg-config: /usr/bin/pkg-config (1.8.1)
Run-time dependency libdrm found: YES 2.4.116
Run-time dependency libdrm_intel found: YES 2.4.116
Run-time dependency libva found: YES 1.19.0
Run-time dependency libva-x11 found: YES 1.19.0
Run-time dependency wayland-client found: YES 1.22.0
Program wayland-scanner found: YES (/usr/bin/wayland-scanner)
Run-time dependency libva-wayland found: YES 1.19.0
intel-vaapi-driver/src/meson.build:10: DEPRECATION: configuration_data.set10 with number. the `set10` method should only be used with booleans
intel-vaapi-driver/src/meson.build:13: DEPRECATION: configuration_data.set10 with number. the `set10` method should only be used with booleans
Checking for function "log2f" : YES 
Configuring config.h using configuration
WARNING: You should add the boolean check kwarg to the run_command call.
         It currently defaults to false,
         but it will default to true in future releases of meson.
         See also: https://github.com/mesonbuild/meson/issues/9300
Configuring intel_version.h using configuration
Build targets in project: 3
NOTICE: Future-deprecated features used:
 * 0.56.0: {'dependency.get_pkgconfig_variable', 'meson.source_root'}

intel-vaapi-driver 2.4.1.0

  User defined options
    auto_features      : enabled
    buildtype          : plain
    libexecdir         : lib
    prefix             : /usr
    sbindir            : bin
    wrap_mode          : nodownload
    python.bytecompile : 1
    b_lto              : true
    b_pie              : true
    enable_hybrid_codec: true

Found ninja-1.11.1 at /usr/bin/ninja
ninja: Entering directory `build'                                                                               
[79/79] Linking target src/i965_drv_video.so
==> Entrando no ambiente de fakeroot...
==> Iniciando package()...
ninja: Entering directory `/home/eduardo/.cache/yay/libva-intel-driver-hybrid/src/build'
ninja: no work to do.
Installing src/i965_drv_video.so to /home/eduardo/.cache/yay/libva-intel-driver-hybrid/pkg/libva-intel-driver-hybrid/usr/lib/dri
==> Organizando a instalação...
  -> Removendo arquivos libtool...
  -> Expurgando arquivos indesejados...
  -> Removendo arquivos de biblioteca estática...
  -> Removendo símbolos desnecessários dos executáveis e bibliotecas...
  -> Comprimindo páginas de man e info...
==> Verificando problemas de empacotamento...
==> Criando o pacote "libva-intel-driver-hybrid"...
  -> Gerando o arquivo .PKGINFO...
  -> Gerando o arquivo .BUILDINFO...
  -> Gerando o arquivo .MTREE ...
  -> Compactando o pacote...
==> Saindo do ambiente de fakeroot.
==> Compilação concluída: libva-intel-driver-hybrid 2.4.1-2 (ter 12 set 2023 09:53:28)
==> Limpando...
carregando pacotes...
resolvendo dependências...
procurando pacotes conflitantes...
:: libva-intel-driver-hybrid e libva-intel-driver estão em conflito. Remover libva-intel-driver? [s/N] s

Pacotes (2) libva-intel-driver-2.4.1-2 [remover]  libva-intel-driver-hybrid-2.4.1-2

Tamanho total instalado:  7,80 MiB
Alteração no tamanho:     0,01 MiB

:: Continuar a instalação? [S/n] 
(1/1) verificando chaves no chaveiro                                [-------------------------------------] 100%
(1/1) verificando integridade do pacote                             [-------------------------------------] 100%
(1/1) carregando arquivos do pacote                                 [-------------------------------------] 100%
(1/1) verificando conflitos de arquivos                             [-------------------------------------] 100%
(2/2) verificando espaço em disco disponível                        [-------------------------------------] 100%
:: Processando alterações do pacote...
(1/1) removendo libva-intel-driver                                  [-------------------------------------] 100%
(1/1) instalando libva-intel-driver-hybrid                          [-------------------------------------] 100%
Dependências opcionais para libva-intel-driver-hybrid
    intel-hybrid-codec-driver: Provides codecs with partial HW acceleration [instalado]
:: Executando hooks pós-transação...



:: Iniciando atualização completa do sistema...
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (3) broadcom-wl-6.30.223.271-500  linux-6.5.3.arch1-1  linux-headers-6.5.3.arch1-1

Tamanho total download:   153,48 MiB
Tamanho total instalado:  252,54 MiB
Alteração no tamanho:       0,05 MiB

:: Continuar a instalação? [S/n] 
:: Obtendo pacotes...
 broadcom-wl-6.30.223.271-500-x86_64   1453,8 KiB   105 KiB/s 00:14 [-------------------------------------] 100%
 linux-headers-6.5.3.arch1-1-x86_64      24,6 MiB   227 KiB/s 01:51 [-------------------------------------] 100%
 linux-6.5.3.arch1-1-x86_64             127,5 MiB   506 KiB/s 04:18 [-------------------------------------] 100%
 Total (3/3)                            153,5 MiB   609 KiB/s 04:18 [-------------------------------------] 100%
(3/3) verificando chaves no chaveiro                                [-------------------------------------] 100%
(3/3) verificando integridade do pacote                             [-------------------------------------] 100%
(3/3) carregando arquivos do pacote                                 [-------------------------------------] 100%
(3/3) verificando conflitos de arquivos                             [-------------------------------------] 100%
(3/3) verificando espaço em disco disponível                        [-------------------------------------] 100%
:: Executando hooks pré-transação...
(1/2) Removing linux initcpios...
(2/2) Remove DKMS modules
==> dkms remove --no-depmod blackmagic-io/12.5a15 -k 6.5.2-arch1-1
==> depmod 6.5.2-arch1-1
:: Processando alterações do pacote...
(1/3) atualizando linux                                             [-------------------------------------] 100%
(2/3) atualizando broadcom-wl                                       [-------------------------------------] 100%
(3/3) atualizando linux-headers                                     [-------------------------------------] 100%
:: Executando hooks pós-transação...
(1/4) Arming ConditionNeedsUpdate...
(2/4) Updating module dependencies...
(3/4) Install DKMS modules
==> dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.3-arch1-1
Error! Bad return status for module build on kernel: 6.5.3-arch1-1 (x86_64)
Consult /var/lib/dkms/linux-sgx-driver/2.14.r1.54c9c4c/build/make.log for more information.
==> WARNING: `dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.3-arch1-1' exited 10
==> dkms install --no-depmod blackmagic/12.5a15 -k 6.5.3-arch1-1
Error! Bad return status for module build on kernel: 6.5.3-arch1-1 (x86_64)
Consult /var/lib/dkms/blackmagic/12.5a15/build/make.log for more information.
==> WARNING: `dkms install --no-depmod blackmagic/12.5a15 -k 6.5.3-arch1-1' exited 10
==> dkms install --no-depmod blackmagic-io/12.5a15 -k 6.5.3-arch1-1
==> depmod 6.5.3-arch1-1


Probing GDK-Pixbuf loader modules...
