# Playme
run rootfs with [Proot](https://github.com/proot-me/PRoot) & [Termux](https://github.com/termux/termux-app)

about proot [Here](https://wiki.termux.com/wiki/PRoot)

# Setup
**Termux**

Download & Install Termux
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
 
**Alpine**

> Setup
```
wget raw.githubusercontent.com/shiru-ri/playme/main/setupalpine.sh && bash setupalpine.sh
```
```
apk add alpine-conf
```
```
setup-apkrepos
```
> enter f
```
apk upgrade && apk update
```
```
apk add sudo wget curl nano
```
```
setup-desktop
```
> xfce
```
setup-timezone
```
> Asia
>
> Pontianak
```
setup-sshd
```
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
> ctrl o. ctrl x
> 
> vncserver :1
> 
> open vnc viewer
> 
> localhost:1

> Remove
```
wget raw.githubusercontent.com/shiru-ri/playme/main/removealpine.sh && bash removealpine.sh
```
# Reference
[Here](https://github.com/Neo-Oli/termux-ubuntu)
