gst-editing-services gst-libav gst-plugin-gtk gst-plugin-msdk gst-plugin-opencv gst-plugin-qml6 gst-plugin-qmlgl gst-plugin-qsv gst-plugin-va gst-plugin-wpe gst-plugins-bad gst-plugins-bad-libs gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gst-python gst-rtsp-server gstreamer gstreamer-docs gstreamer-vaapi opencv tracker3-miners tracker3 gspell nuspell hunspell aspell libvoikko hspell ntp linux-firmware linux-tools mesa libva-vdpau-driver libvdpau-va-gl gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb hidapi intel-media-driver adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts gnome-firmware gnome-menus imagemagick groff vulkan-intel vulkan-mesa-layers smartmontools sushi opencl-mesa orca profile-sync-daemon perl rygel bluez-libs util-linux util-linux-libs vulkan-icd-loader gnome-remote-desktop gnome-session gnome-user-docs gnome-user-share gnome-shell hidapi intel-media-driver eog grilo-plugins mesa libgusb libutempter libproxy libvulkan rygel ocl-icd opencl-mesa orca broadcom-wl chromium gnome-tweaks gnome-text-editor vulkan-headers vulkan-icd-loader gnome-settings-daemon xdg-user-dirs-gtk xdg-desktop-portal-gnome gnome-shell-extensions gnome-keyring gnome-color-manager baobab gnome-console gnome-browser-connector webp-pixbuf-loader gnome-online-accounts ibus libsecret libgnome-keyring gnome-themes-standard db base git gsettings-desktop-schemas glib2 glib2-docs bluez bluez-hid2hci bluez-utils libgusb libutempter libproxy glib gnome-screenshot neofetch ibus-m17n gperftools highway libavif openmpi jbigkit libtiff sane aom opencv licenses pipewire-pulse intel-media-sdk libteam alsa-card-profiles libpipewire pipewire-alsa pipewire-audio pipewire-jack libcloudproviders libva-mesa-driver mesa glib2 vulkan-intel vulkan-icd-loader acpi gnome-bluetooth

ttf-roboto noto-fonts noto-fonts-cjk adobe-source-han-sans-cn-fonzts adobe-source-han-serif-cn-fonts ttf-dejavu ttf-jetbrains-mono noto-fonts-emoji

linux-firmware-bnx2x linux-firmware-liquidio linux-firmware-marvell linux-firmware-mellanox linux-firmware-nfp linux-firmware-qcom linux-firmware-qlogic linux-firmware-whence linux-sgx-driver-dkms-git linux-headers intel-hybrid-codec-driver-git gdk-pixbuf2

tlp zram-generator profile-sync-daemon preload irqbalance firejail rkhunte ufw clamav kooha deja-dup papirus-icon-theme vscodium-bin chromium-wayland-vaapi wireless-regdb

Sync Dependency (4): luajit openmpi srt libtiff
Sync Make Dependency (6): ninja gn jre-openjdk-headlessgperf clang lld

intel-undervolt xf86-video-intel intel-gpu-tools libva-utils fakeroot dconf-editor thermald libdvdcss libreoffice-fresh libreoffice-fresh-pt-br libreoffice-fresh-sdk power-profiles-daemon gnome-shell-extension-appindicator simple-scan drawing gcr gnome-software gnome-software-packagekit-plugin gnome-backgrounds enchant harfbuzz harfbuzz-icu icu libical libsynctex libwbclient libxml2 qt5-base qt6-base raptor smbclient vte-common vte3 vte4 webkit2gtk wpewebkit gnutls intel-media-sdk llvm-libs

pacui expac fzf

filemanager-actions nautilus-sendto nautilus-share seahorse-nautilus easytag brasero file-roller tilix nautilus-codeAUR code-nautilus-gitAUR bubblewrap ffmpegthumbnailer passim libnvme

liboobs decklink nodejs-lts-hydrogen shotcut vscodium

Pacotes (11) abseil-cpp-20230125.3-3  chromium-117.0.5938.88-1  gobject-introspection-runtime-1.78.1-1
             intel-gmmlib-22.3.11-1  intel-media-driver-23.3.3-1  json-glib-1.8.0-1  libcamera-0.1.0-2
             libcamera-ipa-0.1.0-2  libgirepository-1.78.1-1  libgweather-4-4.4.0-1  qt6-imageformats-6.5.2-2

Pacotes (3) glslang-13.0.0-1  libplacebo-5.264.1-3  shaderc-2023.4-2

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
