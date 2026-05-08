#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 --no-emerge --allow-oem --jobs=1
# install cinnamon
ymp it @cinnamon.base gnome-screenshot dejavu udisks2 adwaita-icon-theme gsettings-desktop-schemas polkit-gnome gnome-terminal libhandy libunwind seatd touchegg --no-emerge --allow-oem  --jobs=1
ymp it gnome-icon-theme gnome-themes-standard --no-emerge --allow-oem  --jobs=1
gtk-update-icon-cache /usr/share/icons/hicolor/
# install firefox-installer
ymp it firefox-installer --no-emerge --allow-oem --jobs=1
# install flatpak
ymp it flatpak --no-emerge --allow-oem
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem
# install lightdm
ymp it lightdm-pardus-greeter lightdm --no-emerge --allow-oem
# enable services
rc-update add pipewire default
rc-update add pipewire-pulse default
rc-update add wireplumber default
rc-update add elogind boot
rc-update add eudev sysinit
rc-update add fuse sysinit
rc-update add seatd default
rc-update add upowerd boot
rc-update add wpa_supplicant default
rc-update add networkmanager default
rc-update add lightdm default
rc-update add udisks default
rc-update add bluetooth default
rc-update add polkit default
rc-update add touchegg default
