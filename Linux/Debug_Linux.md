


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


(3/4) Install DKMS modules
==> dkms install --no-depmod blackmagic-io/12.5a15 -k 6.5.4-arch2-1
==> dkms install --no-depmod blackmagic/12.5a15 -k 6.5.4-arch2-1
Error! Bad return status for module build on kernel: 6.5.4-arch2-1 (x86_64)
Consult /var/lib/dkms/blackmagic/12.5a15/build/make.log for more information.
==> WARNING: `dkms install --no-depmod blackmagic/12.5a15 -k 6.5.4-arch2-1' exited 10
==> dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.4-arch2-1
Error! Bad return status for module build on kernel: 6.5.4-arch2-1 (x86_64)
Consult /var/lib/dkms/linux-sgx-driver/2.14.r1.54c9c4c/build/make.log for more information.
==> WARNING: `dkms install --no-depmod linux-sgx-driver/2.14.r1.54c9c4c -k 6.5.4-arch2-1' exited 10
==> depmod 6.5.4-arch2-1
(4/4) Updating linux initcpios...
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'default'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -g /boot/initramfs-linux.img --microcode /boot/intel-ucode.img
==> Starting build: '6.5.4-arch2-1'



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


[eduardo@archlinux ~]$ sudo pacman -Syyu
:: Sincronizando a base de dados de pacotes...
 core                             127,6 KiB   416 KiB/s 00:00 [----------------------------------] 100%
 extra                              8,3 MiB  1205 KiB/s 00:07 [----------------------------------] 100%
:: Iniciando atualização completa do sistema...
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (2) ffmpeg-2:6.0-11  onevpl-2023.3.1-1

Tamanho total download:   12,27 MiB
Tamanho total instalado:  40,87 MiB
Alteração no tamanho:      3,46 MiB

:: Continuar a instalação? [S/n] 
:: Obtendo pacotes...
 onevpl-2023.3.1-1-x86_64         936,0 KiB   691 KiB/s 00:01 [----------------------------------] 100%
 ffmpeg-2:6.0-11-x86_64            11,4 MiB  1257 KiB/s 00:09 [----------------------------------] 100%
 Total (2/2)                       12,3 MiB  1351 KiB/s 00:09 [----------------------------------] 100%
(2/2) verificando chaves no chaveiro                          [----------------------------------] 100%
(2/2) verificando integridade do pacote                       [----------------------------------] 100%
(2/2) carregando arquivos do pacote                           [----------------------------------] 100%
(2/2) verificando conflitos de arquivos                       [----------------------------------] 100%
(2/2) verificando espaço em disco disponível                  [----------------------------------] 100%
:: Processando alterações do pacote...
(1/2) instalando onevpl                                       [----------------------------------] 100%
Dependências opcionais para onevpl
    intel-media-sdk: runtime for legacy Intel GPUs [instalado]
    onevpl-intel-gpu: runtime for Tiger Lake and newer GPUs
(2/2) atualizando ffmpeg                                      [----------------------------------] 100%
Novas dependências opcionais para ffmpeg
    intel-media-sdk: Intel QuickSync support (legacy) [instalado]
    onevpl-intel-gpu: Intel QuickSync support
:: Executando hooks pós-transação...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Configure symlinks in /usr/local/bin based on firecfg.config...
[eduardo@archlinux ~]$ 




[eduardo@archlinux ~]$ sudo pacman -Syyu
[sudo] senha para eduardo: 
:: Sincronizando a base de dados de pacotes...
 core                                   127,6 KiB   721 KiB/s 00:00 [--------------------------------------] 100%
 extra                                    8,2 MiB  2,42 MiB/s 00:03 [--------------------------------------] 100%
:: Iniciando atualização completa do sistema...
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (24) appstream-0.16.3-1  at-spi2-core-2.50.0-1  glib-networking-1:2.78.0-1  gvfs-1.52.0-1
             gvfs-afc-1.52.0-1  gvfs-goa-1.52.0-1  gvfs-google-1.52.0-1  gvfs-gphoto2-1.52.0-1
             gvfs-mtp-1.52.0-1  gvfs-nfs-1.52.0-1  gvfs-smb-1.52.0-1  harfbuzz-8.2.1-1  harfbuzz-icu-8.2.1-1
             libadwaita-1:1.4.0-1  libblockdev-3.0.3-4  libnvme-1.5-1  libp11-kit-0.25.0-2  libsoup3-3.4.3-1
             licenses-20230917-1  p11-kit-0.25.0-2  tracker3-3.6.0-1  tracker3-miners-3.6.0-1  udisks2-2.10.1-1
             webkit2gtk-4.1-2.42.0-1

Tamanho total download:    37,15 MiB
Tamanho total instalado:  166,42 MiB
Alteração no tamanho:      27,48 MiB

Novas dependências opcionais para libblockdev
    exfatprogs: for exFAT filesystem support
    f2fs-tools: for F2FS filesystem support
    gobject-introspection-runtime: for Python integration [instalado]
    nilfs-utils: for nilfs filesystem support
    python: for Python integration [instalado]
    udftools: for UDF filesystem support
( 8/24) atualizando udisks2                                         [--------------------------------------] 100%
( 9/24) atualizando harfbuzz                                        [--------------------------------------] 100%
(10/24) atualizando tracker3                                        [--------------------------------------] 100%
(11/24) atualizando gvfs                                            [--------------------------------------] 100%
(12/24) atualizando gvfs-afc                                        [--------------------------------------] 100%
(13/24) atualizando gvfs-goa                                        [--------------------------------------] 100%
(14/24) atualizando gvfs-google                                     [--------------------------------------] 100%
(15/24) atualizando gvfs-gphoto2                                    [--------------------------------------] 100%
(16/24) atualizando gvfs-mtp                                        [--------------------------------------] 100%
(17/24) atualizando gvfs-nfs                                        [--------------------------------------] 100%
(18/24) atualizando gvfs-smb                                        [--------------------------------------] 100%
(19/24) atualizando harfbuzz-icu                                    [--------------------------------------] 100%
(20/24) instalando appstream                                        [--------------------------------------] 100%
(21/24) atualizando libadwaita                                      [--------------------------------------] 100%
(22/24) atualizando licenses                                        [--------------------------------------] 100%
(23/24) atualizando tracker3-miners                                 [--------------------------------------] 100%
(24/24) atualizando webkit2gtk-4.1                                  [--------------------------------------] 100%
:: Executando hooks pós-transação...
( 1/10) Reloading system manager configuration...
( 2/10) Creating temporary files...
( 3/10) Reloading device manager configuration...
( 4/10) Arming ConditionNeedsUpdate...
( 5/10) Updating the appstream cache...
✔ O cache de metadados foi atualizado com sucesso.
( 6/10) Reloading system bus configuration...
( 7/10) Configure symlinks in /usr/local/bin based on firecfg.config...
( 8/10) Updating GIO module cache...
( 9/10) Compiling GSettings XML schema files...
(10/10) Reloading GVFS config...



systemd-libs-254.4-1-x86_64           1084,7 KiB   396 KiB/s 00:03 [--------------------------------------] 100%
 systemd-sysvcompat-254.4-1-x86_64        6,0 KiB  29,6 KiB/s 00:00 [--------------------------------------] 100%
 openssl-3.1.3-1-x86_64                   4,5 MiB   404 KiB/s 00:11 [--------------------------------------] 100%
 systemd-254.4-1-x86_64                   7,7 MiB   564 KiB/s 00:14 [--------------------------------------] 100%
 qt5-base-5.15.10+kde+r158-1-x86_64 



 [eduardo@archlinux ~]$ sudo pacman -Syyu
:: Sincronizando a base de dados de pacotes...
 core                                   127,5 KiB   104 KiB/s 00:01 [--------------------------------------] 100%
 extra                                    8,2 MiB   288 KiB/s 00:29 [--------------------------------------] 100%
:: Iniciando atualização completa do sistema...
resolvendo dependências...
procurando pacotes conflitantes...

Pacotes (7) argyllcms-3.0.0-1  chromium-117.0.5938.92-2  filesystem-2023.09.18-1  onevpl-intel-gpu-23.3.3-1
            pambase-20230918-1  rsync-3.2.7-5  shadow-4.14.0-3

Tamanho total download:   105,06 MiB
Tamanho total instalado:  458,32 MiB
Alteração no tamanho:      22,56 MiB

:: Continuar a instalação? [S/n] 
:: Obtendo pacotes...
 shadow-4.14.0-3-x86_64                1171,9 KiB  49,2 KiB/s 00:24 [--------------------------------------] 100%
 rsync-3.2.7-5-x86_64                   335,3 KiB  47,8 KiB/s 00:07 [--------------------------------------] 100%
 filesystem-2023.09.18-1-any             14,4 KiB  4,84 KiB/s 00:03 [--------------------------------------] 100%
 pambase-20230918-1-any                   3,1 KiB   903   B/s 00:04 [--------------------------------------] 100%
 onevpl-intel-gpu-23.3.3-1-x86_64         3,3 MiB  58,7 KiB/s 00:58 [--------------------------------------] 100%
 argyllcms-3.0.0-1-x86_64                 7,1 MiB  60,8 KiB/s 01:59 [--------------------------------------] 100%
 chromium-117.0.5938.92-2-x86_64         93,2 MiB   574 KiB/s 02:46 [--------------------------------------] 100%
 Total (7/7)                            105,1 MiB   646 KiB/s 02:47 [--------------------------------------] 100%
(7/7) verificando chaves no chaveiro                                [--------------------------------------] 100%
(7/7) verificando integridade do pacote                             [--------------------------------------] 100%
(7/7) carregando arquivos do pacote                                 [--------------------------------------] 100%
(7/7) verificando conflitos de arquivos                             [--------------------------------------] 100%
(7/7) verificando espaço em disco disponível                        [--------------------------------------] 100%
:: Processando alterações do pacote...
(1/7) atualizando filesystem                                        [--------------------------------------] 100%
atenção: /etc/profile instalado como /etc/profile.pacnew
atenção: /etc/shells instalado como /etc/shells.pacnew
atenção: permissões de diretório diferem em /root/
sistema de arquivos: 700  pacote: 750
(2/7) atualizando argyllcms                                         [--------------------------------------] 100%
(3/7) atualizando pambase                                           [--------------------------------------] 100%
(4/7) atualizando shadow                                            [--------------------------------------] 100%
(5/7) atualizando chromium                                          [--------------------------------------] 100%
(6/7) atualizando onevpl-intel-gpu                                  [--------------------------------------] 100%
(7/7) atualizando rsync                                             [--------------------------------------] 100%
:: Executando hooks pós-transação...
(1/9) Creating system user accounts...
Creating group 'groups' with GID 967.
(2/9) Reloading system manager configuration...
(3/9) Applying kernel sysctl settings...
(4/9) Creating temporary files...
(5/9) Reloading device manager configuration...
(6/9) Arming ConditionNeedsUpdate...
(7/9) Configure symlinks in /usr/local/bin based on firecfg.config...
(8/9) Updating icon theme caches...
(9/9) Updating the desktop file MIME type cache...
[eduardo@archlinux ~]$ 
