#!/bin/bash

timedatectl set-ntp true &&
cfdisk /dev/sdb &&
mkfs.ext4 /dev/sdb1 &&
mkfs.ext4 /dev/sdb2 &&
mkswap /dev/sdb3 &&
swapon /dev/sdb3 &&
#mkfs.ext4 /dev/sda3 &&
mount /dev/sdb2 /mnt/ &&
mkdir /mnt/boot &&
mkdir /mnt/home &&
mount /dev/sdb1 /mnt/boot/ &&
#mount /dev/sdb3 /mnt/home/ &&
#pacman -Sy reflector &&
#reflector -c "Israel" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist &&
#nano /etc/pacman.d/mirrorlist &&
pacstrap /mnt base base-devel dhcpcd wpa_supplicant linux-firmware wireless_tools nano linux-lts grub &&
genfstab -U /mnt >> /mnt/etc/fstab &&
exit
# arch-chroot /mnt &&
