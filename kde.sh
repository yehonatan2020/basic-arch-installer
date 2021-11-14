#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Switzerland -a 6 --sort rate --save /etc/pacman.d/mirrorlist


sudo pacman -S --noconfirm acpi acpi_call alsa-plugins alsa-utils android-tools android-udev apparmor audit ark bind binutils bluedevil bluez bluez-utils bridge-utils ccache clang cpio cronie cups dialog dolphin dosfstools dtc exfat-utils extra-cmake-modules filelight fakeroot ffmpegthumbs gamemode gedit gedit-plugins git gparted gst-libav gst-plugins-bad gst-plugins-ugly guake gwenview hardinfo haveged hplip htop inetutils inkscape ipset jq karchive kauth kcodecs kcompletion kcoreaddons kde-gtk-config kdeplasma-addons kdialog kgamma5 khotkeys kinfocenter konsole kscreen kvantum-qt5 kwayland-integration kwrited latte-dock libappindicator-gtk3 libdvdcss lld llvm lxtask lzip make mono mpv mtools ncurses5-compat-libs neofetch network-manager network-manager-applet ntfs-3g os-prober pacman-contrib pacmanlogviewer patchelf pipewire-alsa pipewire-pulse plasma-desktop plasma-firewall plasma-nm plasma-pa plasma-thunderbolt powerdevil print-manager psensor python2-distlib python-psutil python-notify2 python-pyqt5 python-pyxdg python-yaml rpm rsync redshift sddm sddm-kcm sof-firmware svn swtpm tlp traceroute ufw unclutter unzip usbutils xdg-dekstop-portal-kde xdg-user-dirs xorg xorg-drivers xorg-xinit xsane zsh zsh-autosuggestions zsh-syntax-highlighting efibootmgr


sudo systemctl enable sddm
