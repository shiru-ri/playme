#!/data/data/com.termux/usr/bin/bash

tarball="alpine.tar.gz"

echo "Download"
wget "https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/aarch64/alpine-minirootfs-3.21.3-aarch64.tar.gz" -O $tarball

echo "Setup"
mkdir -p alpine

proot --link2symlink tar -xf ${tarball} -C alpine

rm -rf alpine/etc/resolv.conf
touch alpine/etc/resolv.conf
echo "nameserver 1.1.1.1" > alpine/etc/resolv.conf
rm -rf alpine/etc/hosts
touch alpine/etc/hosts
echo "127.0.0.1 localhost" > alpine/etc/hosts

echo "Make Script"
bin=alpine.sh
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r alpine"
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
command+=" /bin/sh --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

chmod 755 -R alpine

echo "Fix Shebang"
termux-fix-shebang $bin

echo "Set Permission"
chmod +x $bin

echo "run ./${bin}"

rm -rf setupalpine.sh
rm -rf $tarball
