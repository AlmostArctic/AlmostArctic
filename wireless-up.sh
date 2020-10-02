#!/bin/bash 

ip link set wlp3s0 up &&
# iw dev wlp3s0 scan | less &&
wpa_passphrase TNET 51132873 > /etc/wpa_supplicant/TNET.conf &&
#wpa_supplicant -c /etc/wpa_supplicant/New-TNET.conf -i wlp3s0 &&
wpa_supplicant -B -c /etc/wpa_supplicant/TNET.conf -i wlp3s0 &&
dhclient wlp3s0 &&
exit
