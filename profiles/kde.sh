#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 udisks2 --no-emerge --allow-oem --jobs=1
# install kde
ymp it @kde.plasma @kde.frameworks dolphin konsole dejavu tzdata seatd --no-emerge --allow-oem --jobs=1
# fixme: plasma-shell dependency
ymp it kirigami-addons --no-emerge --allow-oem --jobs=1
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem --jobs=1
# install sddm
ymp it sddm --no-emerge --allow-oem --jobs=1
# install firefox-installer
ymp it firefox-installer --no-emerge --allow-oem --jobs=1
# install flatpak
ymp it flatpak --no-emerge --allow-oem
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# set timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/UTC /etc/localtime
# enable services
rc-update add elogind boot
rc-update add eudev sysinit
rc-update add fuse sysinit
rc-update add seatd default
rc-update add upowerd default
rc-update add udisks default
rc-update add wpa_supplicant default
rc-update add networkmanager default
rc-update add sddm default
rc-update add bluetooth default
rc-update add polkit default
