#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi 
grub-mkconfig -o /boot/grub/grub.cfg

#systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
#systemctl enable reflector.timer
#systemctl enable fstrim.timer
#systemctl enable acpid

useradd -m newuser
echo newuser:password | chpasswd
usermod -a newuser

echo "newuser ALL=(ALL) ALL" >> /etc/sudoers


#printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




