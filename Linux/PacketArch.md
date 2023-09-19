gst-editing-services gst-libav gst-plugin-gtk gst-plugin-msdk gst-plugin-opencv gst-plugin-qml6 gst-plugin-qmlgl gst-plugin-qsv gst-plugin-va gst-plugin-wpe gst-plugins-bad gst-plugins-bad-libs gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gst-python gst-rtsp-server gstreamer gstreamer-docs gstreamer-vaapi opencv tracker3-miners tracker3 gspell nuspell hunspell aspell libvoikko hspell ntp linux-firmware linux-tools mesa libva-vdpau-driver libvdpau-va-gl gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb hidapi intel-media-driver adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts gnome-firmware gnome-menus imagemagick groff vulkan-intel vulkan-mesa-layers smartmontools sushi opencl-mesa orca profile-sync-daemon perl rygel bluez-libs util-linux util-linux-libs vulkan-icd-loader gnome-remote-desktop gnome-session gnome-user-docs gnome-user-share gnome-shell hidapi intel-media-driver eog grilo-plugins mesa libgusb libutempter libproxy libvulkan rygel ocl-icd opencl-mesa orca broadcom-wl chromium gnome-tweaks gnome-text-editor vulkan-headers vulkan-icd-loader gnome-settings-daemon xdg-user-dirs-gtk xdg-desktop-portal-gnome gnome-shell-extensions gnome-keyring gnome-color-manager baobab gnome-console gnome-browser-connector webp-pixbuf-loader gnome-online-accounts ibus libsecret libgnome-keyring gnome-themes-standard db base git gsettings-desktop-schemas glib2 glib2-docs bluez bluez-hid2hci bluez-utils libgusb libutempter libproxy glib gnome-screenshot neofetch ibus-m17n gperftools highway libavif openmpi jbigkit libtiff sane aom opencv licenses pipewire-pulse intel-media-sdk libteam alsa-card-profiles libpipewire pipewire-alsa pipewire-audio pipewire-jack libcloudproviders libva-mesa-driver mesa glib2 vulkan-intel vulkan-icd-loader acpi gnome-bluetooth

ttf-roboto noto-fonts noto-fonts-cjk adobe-source-han-sans-cn-fonzts adobe-source-han-serif-cn-fonts ttf-dejavu ttf-jetbrains-mono noto-fonts-emoji

linux-firmware-bnx2x linux-firmware-liquidio linux-firmware-marvell linux-firmware-mellanox linux-firmware-nfp linux-firmware-qcom linux-firmware-qlogic linux-firmware-whence linux-sgx-driver-dkms-git linux-headers intel-hybrid-codec-driver-git gdk-pixbuf2

tlp zram-generator profile-sync-daemon preload irqbalance firejail rkhunte ufw clamav kooha deja-dup papirus-icon-theme vscodium-bin chromium-wayland-vaapi wireless-regdb

Sync Dependency (4): luajit openmpi srt libtiff
Sync Make Dependency (6): ninja gn jre-openjdk-headlessgperf clang lld

intel-undervolt xf86-video-intel intel-gpu-tools libva-utils fakeroot dconf-editor thermald libdvdcss libreoffice-fresh libreoffice-fresh-pt-br libreoffice-fresh-sdk power-profiles-daemon gnome-shell-extension-appindicator simple-scan drawing gcr gnome-software gnome-software-packagekit-plugin gnome-backgrounds enchant harfbuzz harfbuzz-icu icu libical libsynctex libwbclient libxml2 qt5-base qt6-base raptor smbclient vte-common vte3 vte4 webkit2gtk wpewebkit gnutls intel-media-sdk llvm-libs

pacui expac fzf

filemanager-actions nautilus-sendto nautilus-share seahorse-nautilus easytag brasero file-roller tilix nautilus-codeAUR code-nautilus-gitAUR bubblewrap ffmpegthumbnailer passim

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
