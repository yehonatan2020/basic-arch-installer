#!/bin/bash
echo "--------------------------------------"
echo "--          Network Setup           --"
echo "--------------------------------------"
pacman -S networkmanager dhclient --noconfirm --needed
systemctl enable --now NetworkManager
echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download          "
echo "-------------------------------------------------"
pacman -S --noconfirm pacman-contrib curl
pacman -S --noconfirm reflector rsync
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

nc=$(grep -c ^processor /proc/cpuinfo)
echo "You have " $nc" cores."
echo "-------------------------------------------------"
echo "Changing the makeflags for "$nc" cores."
TOTALMEM=$(cat /proc/meminfo | grep -i 'memtotal' | grep -o '[[:digit:]]*')
if [[  $TOTALMEM -gt 8000000 ]]; then
sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
echo "Changing the compression settings for "$nc" cores."
sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf
fi
echo "-------------------------------------------------"
echo "       Setup Language to US and set locale       "
echo "-------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo pacman -S --noconfirm acpi acpi_call alsa-plugins alsa-utils android-tools android-udev apparmor audit ark bind binutils bluedevil bluez bluez-utils bridge-utils ccache clang cpio cronie cups dialog dolphin dosfstools dtc exfat-utils extra-cmake-modules filelight fakeroot ffmpegthumbs gamemode gedit gedit-plugins git gparted gst-libav gst-plugins-bad gst-plugins-ugly guake gwenview hardinfo haveged hplip htop inetutils inkscape ipset jq karchive kauth kcodecs kcompletion kcoreaddons kde-gtk-config kdeplasma-addons kdialog kgamma5 khotkeys kinfocenter konsole kscreen kvantum-qt5 kwayland-integration kwrited latte-dock libappindicator-gtk3 libdvdcss lld llvm lxtask lzip make mono mpv mtools ncurses5-compat-libs neofetch network-manager-applet ntfs-3g os-prober pacmanlogviewer patchelf pipewire-alsa pipewire-pulse plasma-desktop plasma-firewall plasma-nm plasma-pa plasma-thunderbolt powerdevil print-manager psensor python2-distlib python-psutil python-notify2 python-pyqt5 python-pyxdg python-yaml rpm redshift sddm sddm-kcm sof-firmware svn swtpm tlp traceroute ufw unclutter unzip usbutils xdg-dekstop-portal-kde xdg-user-dirs xorg xorg-drivers xorg-xinit xsane zsh zsh-autosuggestions zsh-syntax-highlighting efibootmgr


sudo systemctl enable sddm
sudo systemctl enable apparmor
sudo systemctl enable bluetooth
sudo systemctl enable cups.service
sudo systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
sudo systemctl enable reflector.timer
sudo systemctl enable fstrim.timer
sudo systemctl enable acpid
