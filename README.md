# Playme
run rootfs with [Proot](https://github.com/proot-me/PRoot) & [Termux](https://github.com/termux/termux-app)

about proot [Here](https://wiki.termux.com/wiki/PRoot)

# Setup
**Termux**

Download & Install Termux
> Copy The Command
```
pkg install x11-repo -y
```
```
pkg update && pkg upgrade -y
```
```
pkg install proot wget curl -y
```
```
termux-setup-storage
```
> Allow
 
**ROOTFS**

[Manjaro](https://github.com/manjaro-arm/rootfs)
> Setup
>
> copy in termux
```
wget raw.githubusercontent.com/shiru-ri/playme/main/setupmanjaro.sh && bash setupmanjaro.sh
```
> Run
```
./manjaro.sh
```
```
pacman-key --init
```
```
pacman-key --populate
```
```
pacman-key --updatedb
```
```
pacman-key --refresh-keys
```
```
pacman-mirrors --fasttrack
```
```
pacman -Syyu
```
```
pacman -S nano wget sudo curl
```
> Install Xfce
```
pacman -S xfce4 xfce4-goodies
```
```
pacman -S xorg
```
> Install VNC
```
pacman -S tigervnc
```
```
vncpasswd
```
> enter password
> 
> create file
```
nano ~/.vnc/config
```
```
session=xfce
securitytypes=vncauth,tlsvnc
geometry=1280x720
localhost
```
> ctrl + o. ctrl x
> 
> vncserver :1
> 
> connect to vnc
>
> localhost:1
>
> click logout to disconnect vnc.

> Remove
>
> if you want to remove. copy this command on termux. not inside distro
```
wget raw.githubusercontent.com/shiru-ri/playme/main/removemanjaro.sh && bash removemanjaro.sh
```



Alpine

> Setup
```
wget raw.githubusercontent.com/shiru-ri/playme/main/setupalpine.sh && bash setupalpine.sh
```
> not all function in setup-alpine is work. because is not fresh install like on pc. so dont use command setup-alpine. just use sub command part of setup-alpine.
```
apk add alpine-conf
```
```
setup-apkrepos
```
> enter f
>
> wait until done
```
apk upgrade && apk update
```
```
apk add sudo wget curl nano
```
```
setup-desktop
```
> enter desktop you want to install. example enter
>
> xfce
```
setup-timezone
```
> enter. example
>
> Asia
>
> Pontianak
```
setup-sshd
```
> select ssh you want to use
>




> optional. you can skip this
```
setup-dns
```
```
1dot1dot1dot1.cloudflare-dns.com
```
> enter
```
1.1.1.1
```
> enter
```
rc-update add dbus
```
```
rc-service dbus start
```
> Install VNC
```
apk add tigervnc
```
```
vncpasswd
```
> enter password
```
nano ~/.vnc/config
```
```
session=xfce
securitytypes=vncauth,tlsvnc
geometry=1280x720
localhost
```
> ctrl +o. ctrl x
> 
> vncserver :1
> 
> connect to vnc
> 
> localhost:1
> 
> logout to disconnect vnc


> Remove
```
wget raw.githubusercontent.com/shiru-ri/playme/main/removealpine.sh && bash removealpine.sh
```
# Reference
[Here](https://github.com/Neo-Oli/termux-ubuntu)
