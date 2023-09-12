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

To disable watchdog timers (both software and hardware), append nowatchdog to your boot parameters.

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


Dependências opcionais para chromium
    pipewire: WebRTC desktop sharing under Wayland [instalado]
    kdialog: support for native dialogs in Plasma
    qt5-base: enable Qt5 with --enable-features=AllowQt [instalado]
    org.freedesktop.secrets: password storage backend on GNOME / Xfce [instalado]
    kwallet: support for storing passwords in KWallet on Plasma

>>> This driver now uses DRI3 as the default Direct Rendering
    Infrastructure. You can try falling back to DRI2 if you run
    into trouble. To do so, save a file with the following 
    content as /etc/X11/xorg.conf.d/20-intel.conf :
      Section "Device"
        Identifier  "Intel Graphics"
        Driver      "intel"
        Option      "DRI" "2"             # DRI3 is now default 
        #Option      "AccelMethod"  "sna" # default
        #Option      "AccelMethod"  "uxa" # fallback
      EndSection
Dependências opcionais para xf86-video-intel
    libxrandr: for intel-virtual-output [instalado]
    libxinerama: for intel-virtual-output [instalado]
    libxcursor: for intel-virtual-output [instalado]
    libxtst: for intel-virtual-output [instalado]
    libxss: for intel-virtual-output [instalado]
:: Executando hooks pós-transação...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Configure symlinks in /usr/local/bin based on firecfg.config...
Pacotes (8) broadcom-wl-6.30.223.271-499  glib2-2.78.0-1  gobject-introspection-runtime-1.78.0-1
            harfbuzz-8.2.0-1  harfbuzz-icu-8.2.0-1  libgirepository-1.78.0-1  linux-6.5.2.arch1-1
            luajit-2.1.1694285958-1

            [eduardo@archlinux ~]$ yay -S linux-headers
Sync Explicit (1): linux-headers-6.5.2.arch1-1
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (2) pahole-1:1.25-4  linux-headers-6.5.2.arch1-1

Tamanho total download:    24,82 MiB
Tamanho total instalado:  124,40 MiB

:: Continuar a instalação? [S/n] 
:: Obtendo pacotes...
 pahole-1:1.25-4-x86_64            294,6 KiB   763 KiB/s 00:00 [----------------------------------] 100%
 linux-headers-6.5.2.arch1-1-...    24,5 MiB  2,32 MiB/s 00:11 [----------------------------------] 100%
 Total (2/2)                        24,8 MiB  2,34 MiB/s 00:11 [----------------------------------] 100%
(2/2) verificando chaves no chaveiro                           [----------------------------------] 100%
(2/2) verificando integridade do pacote                        [----------------------------------] 100%
(2/2) carregando arquivos do pacote                            [----------------------------------] 100%
(2/2) verificando conflitos de arquivos                        [----------------------------------] 100%
(2/2) verificando espaço em disco disponível                   [----------------------------------] 100%
:: Processando alterações do pacote...
(1/2) instalando pahole                                        [----------------------------------] 100%
Dependências opcionais para pahole
    ostra-cg: Generate call graphs from encoded traces
(2/2) instalando linux-headers                                 [----------------------------------] 100%
:: Executando hooks pós-transação...
(1/4) Arming ConditionNeedsUpdate...
(2/4) Updating module dependencies...
(3/4) Install DKMS modules
==> dkms install --no-depmod blackmagic-io/12.5a15 -k 6.5.2-arch1-1
==> dkms install --no-depmod blackmagic/12.5a15 -k 6.5.2-arch1-1
Error! Bad return status for module build on kernel: 6.5.2-arch1-1 (x86_64)
Consult /var/lib/dkms/blackmagic/12.5a15/build/make.log for more information.
==> WARNING: `dkms install --no-depmod blackmagic/12.5a15 -k 6.5.2-arch1-1' exited 10
==> dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.2-arch1-1
Error! Bad return status for module build on kernel: 6.5.2-arch1-1 (x86_64)
Consult /var/lib/dkms/linux-sgx-driver/2.14.r1.54c9c4c/build/make.log for more information.
==> WARNING: `dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.2-arch1-1' exited 10
==> depmod 6.5.2-arch1-1


468  modinfo i915
  469  dmesg 
  470  sudo dmesg 
  471  yay -Ss vulkan-mesa-layers
  472  sudo vim /etc/default/grub 
  473  sudo grub-mkconfig -o /boot/GRUB/grub.cfg 
  474  yay -Ss xf86-video-intel
  475  sudo vim /etc/default/grub 
  476  firejail --noprofile chromium
  477  sudo dmesg 
  478  sudo vim /etc/default/grub 
  479  sudo grub-mkconfig -o /boot/GRUB/grub.cfg 
  480  xrandr --listproviders
  481  yay -S xf86-video-intel
  482  glxinfo | grep "OpenGL renderer"
  483  yay -S vulkan-mesa-layers
  484  cat /sys/class/drm/card*/device/power_state
  485  sudo vim /sys/class/drm/card*/device/power_state
  486  sudo dmesg 
  487  sudo dmesg 
  488  sudo dmesg 
  489  firejail --noprofile chromium
  490  firejail --noprofile chromium
  491  sudo dmesg 
  492  sudo dmesg 
  493  sudo dmesg 
  494  sudo vim /etc/mkinitcpio.conf
  495  sudo vim /etc/mkinitcpio.conf
  496  sudo grub-mkconfig -o /boot/GRUB/grub.cfg 
  497  sudo mkinitcpio -P linux
  498  yay -Ss linux-sgx-driver-dkms-git
  499  yay -S linux-sgx-driver-dkms-git
  500  pacui
  501  yay -Ss dkms
  502  dkms status
  503  dkms autoinstall
  504  sudo dkms autoinstall
  505  sudo dkms status
  506  sudo dkms install linux-sgx-driver/2.14.r1.54c9c4c
  507  sudo pacman -S linux-headers-6.5.2-arch1-1
  508  sudo pacman -Ss linux-headers-6.5.2-arch1-1
  509  yay -Ss linux-headers 6.5.2.arch1-1
  510  yay -Ss linux-headers-6.5.2.arch1-1
  511  yay -Ss linux-headers
  512  yay -S linux-headers



carregando pacotes...
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (1) linux-sgx-driver-dkms-git-2.14.r1.54c9c4c-1

Tamanho total instalado:  0,18 MiB

:: Continuar a instalação? [S/n] 
(1/1) verificando chaves no chaveiro                           [----------------------------------] 100%
(1/1) verificando integridade do pacote                        [----------------------------------] 100%
(1/1) carregando arquivos do pacote                            [----------------------------------] 100%
(1/1) verificando conflitos de arquivos                        [----------------------------------] 100%
(1/1) verificando espaço em disco disponível                   [----------------------------------] 100%
:: Processando alterações do pacote...
(1/1) instalando linux-sgx-driver-dkms-git                     [----------------------------------] 100%
Dependências opcionais para linux-sgx-driver-dkms-git
    linux-headers: Build the module for Arch kernel
    linux-lts-headers: Build the module for LTS Arch kernel
    linux-zen-headers: Build the module for Zen Arch kernel
:: Executando hooks pós-transação...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Install DKMS modules
==> ERROR: Missing opt kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing bin kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing run kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing sys kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing dev kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing tmp kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing var kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing sbin kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing fontconfig kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing usr kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing lib kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing srv kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing boot kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing etc kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing root kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing home kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing mnt kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing proc kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.
==> ERROR: Missing lib64 kernel headers for module linux-sgx-driver/2.14.r1.54c9c4c.



[eduardo@archlinux ~]$ yay -S linux-headers
Sync Explicit (1): linux-headers-6.5.2.arch1-1
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (2) pahole-1:1.25-4  linux-headers-6.5.2.arch1-1

Tamanho total download:    24,82 MiB
Tamanho total instalado:  124,40 MiB

:: Continuar a instalação? [S/n] 
:: Obtendo pacotes...
 pahole-1:1.25-4-x86_64            294,6 KiB   763 KiB/s 00:00 [----------------------------------] 100%
 linux-headers-6.5.2.arch1-1-...    24,5 MiB  2,32 MiB/s 00:11 [----------------------------------] 100%
 Total (2/2)                        24,8 MiB  2,34 MiB/s 00:11 [----------------------------------] 100%
(2/2) verificando chaves no chaveiro                           [----------------------------------] 100%
(2/2) verificando integridade do pacote                        [----------------------------------] 100%
(2/2) carregando arquivos do pacote                            [----------------------------------] 100%
(2/2) verificando conflitos de arquivos                        [----------------------------------] 100%
(2/2) verificando espaço em disco disponível                   [----------------------------------] 100%
:: Processando alterações do pacote...
(1/2) instalando pahole                                        [----------------------------------] 100%
Dependências opcionais para pahole
    ostra-cg: Generate call graphs from encoded traces
(2/2) instalando linux-headers                                 [----------------------------------] 100%
:: Executando hooks pós-transação...
(1/4) Arming ConditionNeedsUpdate...
(2/4) Updating module dependencies...
(3/4) Install DKMS modules
==> dkms install --no-depmod blackmagic-io/12.5a15 -k 6.5.2-arch1-1
==> dkms install --no-depmod blackmagic/12.5a15 -k 6.5.2-arch1-1
Error! Bad return status for module build on kernel: 6.5.2-arch1-1 (x86_64)
Consult /var/lib/dkms/blackmagic/12.5a15/build/make.log for more information.
==> WARNING: `dkms install --no-depmod blackmagic/12.5a15 -k 6.5.2-arch1-1' exited 10
==> dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.2-arch1-1
Error! Bad return status for module build on kernel: 6.5.2-arch1-1 (x86_64)
Consult /var/lib/dkms/linux-sgx-driver/2.14.r1.54c9c4c/build/make.log for more information.
==> WARNING: `dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.2-arch1-1' exited 10
==> depmod 6.5.2-arch1-1
(4/4) Configure symlinks in /usr/local/bin based on firecfg.config...


sudo dkms autoinstall
[sudo] senha para eduardo: 
Sign command: /usr/lib/modules/6.5.2-arch1-1/build/scripts/sign-file
Signing key: /var/lib/dkms/mok.key
Public certificate (MOK): /var/lib/dkms/mok.pub

Building module:
Cleaning build area...
make -j4 KERNELRELEASE=6.5.2-arch1-1 KERNELRELEASE=6.5.2-arch1-1....(bad exit status: 2)
Error! Bad return status for module build on kernel: 6.5.2-arch1-1 (x86_64)
Consult /var/lib/dkms/blackmagic/12.5a15/build/make.log for more information.
Sign command: /usr/lib/modules/6.5.2-arch1-1/build/scripts/sign-file
Signing key: /var/lib/dkms/mok.key
Public certificate (MOK): /var/lib/dkms/mok.pub

Building module:
Cleaning build area...
KDIR=/usr/lib/modules/6.5.2-arch1-1/build make...(bad exit status: 2)
Error! Bad return status for module build on kernel: 6.5.2-arch1-1 (x86_64)
Consult /var/lib/dkms/linux-sgx-driver/2.14.r1.54c9c4c/build/make.log for more information.
dkms autoinstall on 6.5.2-arch1-1/x86_64 succeeded for blackmagic-io
dkms autoinstall on 6.5.2-arch1-1/x86_64 failed for blackmagic(10) linux-sgx-driver(10)
Error! One or more modules failed to install during autoinstall.
Refer to previous errors for more information.


Novas dependências opcionais para python
    python-pip: for installing Python packages using tooling that is usually bundled with
    Python
    python-pipx: for installing Python software not packaged on Arch Linux
    python-setuptools: for building Python packages using tooling that is usually bundled with
    Python
    sqlite: for a default database integration [instalado]
(12/12) atualizando systemd-sysvcompat   



## NOTE ##

Due to a bug this package _might_ no longer provides support for using vaapi via X11.
Apps configured to use vaapi in this way (e.g. VLC, MPV) should be changed to
use vaapi via DRM.


## NOTE ##

Supported Platforms | Features
--------------------+--------------
Haswell       (HSW) | vp8enc
Bay Trail M   (BYT) | vp8enc
Broadwell     (BRW) | vp9dec vp9enc
Braswell      (BSW) | vp8enc vp9dec

The libva-intel-driver package isn't compiled with support for loading this driver
so in order to use this driver's features with non hybrid codecs either
recompile libva-intel-driver with the --enable-hybrid-codec or install
the libva-intel-driver-hybrid package from the AUR

Dependências opcionais para intel-hybrid-codec-driver-git
    libva-intel-driver-hybrid: To be able to use the full hw codecs with hybrid codecs
