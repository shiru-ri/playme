#!/data/data/com.termux/usr/bin/bash

tarball="void.tar.xz"

echo "Download"
wget "https://repo-default.voidlinux.org/live/current/void-aarch64-musl-ROOTFS-20240314.tar.xz" -O $tarball

echo "Setup"
mkdir -p void

proot --link2symlink tar -xJf ${tarball} -C void

rm -rf void/etc/resolv.conf
touch void/etc/resolv.conf
echo "nameserver 1.1.1.1" > void/etc/resolv.conf
rm -rf void/etc/hosts
touch void/etc/hosts
echo "127.0.0.1 localhost" > void/etc/hosts

echo "Make Script"
bin=void.sh
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r void"
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
command+=" -b /sdcard"
command+=" -w /root"
command+=" -k 6.11.8"
command+=" --ashmem-memfd"
command+=" --kill-on-exit"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:"
command+=" TERM=\$TERM"
command+=" LANG=en_GB.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

chmod 755 -R void

echo "Fix Shebang"
termux-fix-shebang $bin

echo "Set Permission"
chmod +x $bin

echo "run ./${bin}"

rm -rf setupvoid.sh
rm -rf $tarball
