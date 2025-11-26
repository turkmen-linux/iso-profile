#!/bin/bash
# fstab add tmpfs
echo "tmpfs /tmp tmpfs rw 0 0" > /etc/fstab
ln -s /proc/mounts /etc/mtab
# enable login from shadow
chmod u+s /usr/bin/su || true
echo "/usr/bin/su" > /etc/suid.d/shadow
rc-update add nosuid
# set language
mkdir -p /lib64/locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "" >> /etc/locale.gen
echo "export LANG=en_US.UTF-8" > /etc/profile.d/locale.sh
echo "export LC_ALL=en_US.UTF-8" >> /etc/profile.d/locale.sh
locale-gen
# polkit enable
chmod u+s /usr/bin/pkexec /usr/lib64/polkit-1/polkit-agent-helper-1 || true
echo "/usr/bin/pkexec" > /etc/suid.d/polkit
echo "/usr/lib64/polkit-1/polkit-agent-helper-1" >> /etc/suid.d/polkit
# enable shells
echo "/bin/bash" > /etc/shells
echo "/bin/sh" >> /etc/shells
echo "/bin/ash" >> /etc/shells
# add lsl
ymp install lsl --no-emerge --allow-oem
# add installer
ymp install btrfs-progs e2fsprogs dialog grub parted \
    popt dosfstools rsync --no-emerge --allow-oem
rm -f /sbin/init
wget https://gitlab.com/turkman/devel/sources/installer/-/raw/master/main.sh -O /sbin/init
chmod 755 /sbin/init
# fixme stuff
gdk-pixbuf-query-loaders --update-cache || true
# enable services
rc-update add hostname boot
rc-update add devfs sysinit
# reduce iso size
ymp install no-static --no-emerge --allow-oem
touch /.allow-oem
# ymp clean
ymp clean --allow-oem
