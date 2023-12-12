--------------------------------------------------------------------------Inicio da instalação instalação----------------------------------------------------------------------------------
pacman-key --init
pacman-key --populate archlinux

--------------------------------------------------------------------------PODERES DE SUPER USER----------------------------------------------------------------------------------
https://wiki.archlinux.org/title/Sudo_(Portugu%C3%AAs)

TEM QUE SER FEITO COMO ROOT
EDITOR=vim visudo

%wheel      ALL=(ALL) ALL (DESCOMENTE) 

--------------------------------------------------------------------------DESABILITAR WATCHDOG----------------------------------------------------------------------------------
https://forum.endeavouros.com/t/slightly-slower-boot-and-shutdown/4466/5
https://wiki.archlinux.org/title/Improving_performance_(Portugu%C3%AAs)

## To disable watchdog timers (both software and hardware), append nowatchdog to your boot parameters.

e.g. sudo vim /etc/default/grub
add nowatchdog to the kernel line like so:
GRUB_CMDLINE_LINUX_DEFAULT="quiet nowatchdog ..."
save [Ctrl+X]
rebuild grub.cfg:
sudo grub-mkconfig -o /boot/grub/grub.cfg
reboot

Criar os arquivos
sudo vim /etc/sysctl.d/disable_watchdog.conf
kernel.nmi_watchdog = 0

sudo vim /etc/modprobe.d/watchdog.conf
blacklist iTCO_wdt 
blacklist iTCO_vendor_support
blacklist sp5100_tco

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch --recheck
sudo grub-mkconfig -o /boot/grub/grub.cfg 

------------------------------Install TLP-------------------------------------
sudo vim /etc/tlp.conf 
sudo tlp-start
sudo systemctl start tlp.service
sudo systemctl enable tlp.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
sudo tlp-stat -s -t -b -c -d -e -g -p -r -s -u - w -v

* Install ethtool to disable Wake-on-LAN
* Install smartmontools for disk drive health info

-----------------------------Install zram-generator-----------------------------

https://aur.archlinux.org/cgit/aur.git/tree/zram-generator.install?h=zram-generator-git
https://aur.archlinux.org/cgit/aur.git/tree/half-memory.conf.example?h=zram-generator-git

zram is a Linux kernel module for creating a compressed block device in RAM. It can be used as swap to increase system performance.

Find example config file
find / -name "zram-generator.conf.example"

Copy example config
sudo cp /usr/share/doc/zram-generator/zram-generator.conf.example /etc/systemd/zram-generator.conf

Edit the config using vim
sudo vim /etc/systemd/zram-generator.conf
##########################################################
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

##########################################################

Create new device units
systemctl daemon-reload

Enable zram as swap
systemctl start /dev/zram0

----------------------------------- Disabling the PC speaker ----------------------------------

https://wiki.archlinux.org/title/PC_speaker#Beep

# rmmod pcspkr

/etc/modprobe.d/nobeep.conf
blacklist pcspkr

--------------------- FIREFOX RESPEITA O GERENCIADOR WAYLAND ------------------

https://wiki.archlinux.org/title/Firefox
https://wiki.archlinux.org/title/Firefox#Wayland

More recent versions of Firefox support opting into Wayland mode via an environment variable.
$ MOZ_ENABLE_WAYLAND=1 firefox

sudo vim etc/profile:
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

--------------------------- Firefox/Profile on RAM -----------------------------

https://wiki.archlinux.org/title/Firefox/Profile_on_RAM#Relocate_cache_to_RAM_only
https://wiki.archlinux.org/title/Profile-sync-daemon#Installation
https://www.verot.net/firefox_tmpfs.htm

psd
cd /
sudo vim /home/eduardo/.config/psd/psd.conf 
sudo EDITOR=vim visudo
sudo  systemctl --global start psd
sudo  systemctl --user enable resync
sudo  systemctl --global status psd
sudo loginctl enable-linger eduardo

------------------------ YAY  --------------------------
git clone https://aur.archlinux.org/yay.git
https://github.com/Jguer/yay

pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
Use yay -Y --gendb 
yay -Syu --devel
Use yay -Y --devel --save

------------------------------- Install PRELOAD ---------------------------------

git clone https://aur.archlinux.org/preload.git
cd preload
makepkg -si
sudo vim /etc/preload.conf 
memfree = 90
memcached = 35
processes = 50

sudo systemctl enable preload.service
sudo systemctl start preload.service
sudo systemctl status preload.service

------------------------------- Variaveis de ambiente ---------------------------------

Para incluir a variavel.
export GST_VAAPI_ALL_DRIVERS=1
export LIBVA_DRIVER_NAME=iHD

Para excluir a variavel
unset GST_VAAPI_ALL_DRIVERS

sudo vim etc/profile
export GST_VAAPI_ALL_DRIVERS=1
export LIBVA_DRIVER_NAME=iHD
export NO_AT_BRIDGE=1

you need to re-login or source /etc/profile.d/jre.sh
set _JAVA_AWT_WM_NONREPARENTING=1 in /etc/profile.d/jre.sh
env

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
----------------------------------------------------------------------------------------------------

https://wiki.archlinux.org/title/Font_configuration/Chinese

mkdir fontconfig
vim fontconfig/fonts.conf
fontconfig/fonts.conf

-------------------------------------------------------------------------------------------
    https://wiki.archlinux.org/title/Undervolting_CPU
    
    sudo pacman -S intel-undervolt
    sudo intel-undervolt read


    sudo vim /etc/intel-undervolt.conf
    ...
undervolt 0 'CPU' 0
undervolt 1 'GPU' 0
undervolt 2 'CPU Cache' -100
undervolt 3 'System Agent' 0
undervolt 4 'Analog I/O' 0
...

    intel-undervolt apply

    sudo systemctl daemon-reload
    sudo systemctl enable intel-undervolt.service
    sudo systemctl status intel-undervolt.service
    sudo systemctl start intel-undervolt.service
    sudo systemctl status intel-undervolt.service
 
  ------------------------------------------------------------------------------------------
  
    sudo vim /etc/modprobe.d/i915.conf
    options i915 enable_guc=2
    options i915 enable_fbc=1
    options i915 fastboot=1

    sudo mkinitcpio -p linux
 
--------------------------------------------------------------------------------------------

https://www.youtube.com/watch?v=Fx34KJzj2rs
https://unity.ubuntuunity.org/blog/unity-for-arch/

COMMANDS:
pacman-key --init
pacman-key --populate archlinux
archinstall

curl https://unity.ruds.io/repo.key | sudo pacman-key --add -
sudo pacman-key --lsign-key 3FB6809130A5DB7F

[arch-unity]
SigLevel = Required DatabaseOptional
Server = https://unity.ruds.io/arch-unity

sudo sh -c "pacman -Syyu; pacman -S unity-meta"
sudo systemctl enable --now lightdm

--------------------------------------------
sudo pacman -Syu
*erro: falha ao sincronizar todas as bases de dados (não foi possível travar a base de dados)* 
ps -e | grep pacman
sudo rm /var/lib/pacman/db.lck

------------------------------- Install IMPRESSORA EPSON L210 ---------------------------------

https://www.google.com/search?client=firefox-b-d&q=epson+l210+archlinux

Install IMPRESSORA EPSON L210
git clone https://aur.archlinux.org/packages/epson-inkjet-printer-201207w

SOMENTE PARA PESQUISA OS LINKs ABAIXO:
https://wiki.archlinux.org/title/CUPS#Manufacturer-specific_drivers
https://wiki.archlinux.org/title/CUPS/Printer-specific_problems


