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
wget raw.githubusercontent.com/shiru-ri/playme/master/setupalpine.sh && bash setupalpine.sh
```
```
apk upgrade && apk update
```
```
apk add sudo wget curl nano
```
```
apk add xfce4
```
```
apk add xorg-server
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
wget raw.githubusercontent.com/shiru-ri/playme/master/removealpine.sh && bash removealpine.sh
```
# Reference
[Here](https://github.com/Neo-Oli/termux-ubuntu)
