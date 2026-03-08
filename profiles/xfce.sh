#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 --no-emerge --allow-oem --jobs=1
# install xfce
ymp it @xfce.base xfce4-terminal xfce-polkit xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screenshooter mousepad ristretto --no-emerge --allow-oem --jobs=1
ymp it dejavu adwaita-icon-theme gsettings-desktop-schemas --no-emerge --allow-oem --jobs=1
gtk-update-icon-cache /usr/share/icons/hicolor/
# install firefox-installer
ymp it firefox-installer --no-emerge --allow-oem --jobs=1
# install flatpak
ymp it flatpak --no-emerge --allow-oem
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem --jobs=1
# install lightdm
ymp it lightdm-gtk-greeter lightdm --no-emerge --allow-oem --jobs=1
rc-update add wpa_supplicant default
rc-update add networkmanager default
rc-update add lightdm default
rc-update add bluetooth default
# enable services
rc-update add polkit default
rc-update add elogind boot
rc-update add eudev sysinit
rc-update add fuse sysinit
