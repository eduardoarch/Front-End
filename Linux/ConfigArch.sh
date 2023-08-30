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


