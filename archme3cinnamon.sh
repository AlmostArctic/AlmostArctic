#!/bin/bash
## This script should run only AFTER the archme2 script has been run and afterwards the system was rebooted and logged in as user.
sudo pacman -S alsa-utils xorg xorg-xinit lightdm-gtk-greeter networkmanager network-manager-applet modemmanager htop bluez gnome-terminal cmake samba tlp ntfs-3g gvfs-smb galculator gparted grsync cinnamon nemo-share xed neofetch firefox thunderbird transmission-gtk audacity vlc shotwell blender xcursor-themes adapta-gtk-theme handbrake papirus-icon-theme gimp libreoffice-fresh audacious geany-plugins shotcut firefox-adblock-plus obs-studio ddrescue hunspell-en_US aspell-en libmythes mythes-en languagetool git hunspell-he &&
#exit &&
cd ~ &&
echo "exec cinnamon-session" > .xinitrc &&
startx &&
# If everything installed correctly this should start the grahical interface. If you end up back in the CLI, re-examine if you've 
#forgotten to install something 
# or have deviated from the instructions.
# ONLY If you are in the GUI, open the terminal emulator and continue from there with the following commands.
sudo systemctl enable lightdm &&
sudo systemctl enable NetworkManager &&
git clone https://aur.archlinux.org/pamac-aur.git &&
cd /home/lt/pamac-aur/ &&
makepkg -si &&
cd ~ &&
## sudo pacman -S pacman-mirrorlist &&
# Enable multilib by uncommenting it in the following file.
sudo nano /etc/pacman.conf &&
exit
