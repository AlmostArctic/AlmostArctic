#!/bin/bash
## This script should run only AFTER the chroot command is issued.
ln -sf /usr/share/zoneinfo/Asia/Jerusalem /etc/localtime &&
hwclock --systohc &&
nano /etc/locale.gen &&
locale-gen &&
echo "LANG=en_IL.UTF-8" > /etc/locale.conf &&
echo "KEYMAP=fi" > /etc/vconsole.conf &&
echo "vm.swappiness=10" > /etc/sysctl.d/100-arch.conf &&
echo "T430" > /etc/hostname &&
# nano /etc/hosts &&
echo "127.0.1.1  T430.localdomain  T430" > /etc/hosts &&
mkinitcpio -p linux-lts
passwd &&
grub-install --target=i386-pc /dev/sda &&
grub-mkconfig -o /boot/grub/grub.cfg &&
systemctl enable dhcpcd &&
useradd -m -G wheel -s /bin/bash lt && 
passwd lt &&
EDITOR=nano visudo &&
exit
# reboot
