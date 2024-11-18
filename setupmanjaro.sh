#!/data/data/com.termux/usr/bin/bash

tarball="manjaro.tar.gz"

echo "Download"
wget "https://github.com/manjaro-arm/rootfs/releases/download/20240701/Manjaro-ARM-aarch64-latest.tar.gz" -O $tarball

echo "Setup"
mkdir -p manjaro

proot --link2symlink tar -xf ${tarball} -C manjaro

rm -rf manjaro/etc/resolv.conf
touch manjaro/etc/resolv.conf
echo "nameserver 1.1.1.1" > manjaro/etc/resolv.conf
rm -rf manjaro/etc/hosts
touch manjaro/etc/hosts
echo "127.0.0.1 localhost" > manjaro/etc/hosts

echo "Make Script"
bin=manjaro.sh
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r manjaro"
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
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

chmod 755 -R manjaro

echo "Fix Shebang"
termux-fix-shebang $bin

echo "Set Permission"
chmod +x $bin

echo "run ./${bin}"

rm -rf setupmanjaro.sh
rm -rf $tarball
