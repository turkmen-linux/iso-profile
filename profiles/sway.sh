#!/bin/sh
# install sway
ymp repo --update --allow-oem --ignore-gpg
ymp it shadow sway foot dejavu eudev elogind freetype seatd xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
# TODO: sway dependency
ymp it pango xcb-util-renderutil libbsd libXfont2 libmd brotli gdk-pixbuf --no-emerge --allow-oem --jobs=1
# weston for debug
#ymp it weston --no-emerge --allow-oem
# install flatpak
ymp it flatpak dconf --no-emerge --allow-oem
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
# enable services
rc-update add elogind boot
rc-update add eudev sysinit
rc-update add seatd default
rc-update add udhcpc boot
