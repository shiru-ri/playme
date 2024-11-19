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
pkg install proot wget pulseaudio termux-api curl termux-x11 -y
```
```
termux-setup-storage
```
> Allow
 
**ROOTFS**

[Manjaro](https://github.com/manjaro-arm/rootfs)
> Setup
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
> Remove
```
wget raw.githubusercontent.com/shiru-ri/playme/main/removemanjaro.sh && bash removemanjaro.sh
```

Void
> Musl C
```
wget raw.githubusercontent.com/shiru-ri/playme/main/setupvoid.sh && bash setupvoid.sh
```
> Run
```
./void.sh
```
Warning Void Linux buggy on vnc server. sometimes auto close. use at your own risk. stop vnc & rerun again vnc
```
xbps-install -Su
```
```
xbps-install sudo nano wget curl
```
Install Xfce
```
xbps-install xcfe4
```
```
xbps-install xorg turbovnc
```
> Setup VNC
```
vncpasswd
```
> enter password
```
nano /etc/X11/xinit/xinitrc
```
> scroll to bottom. uncomment use # at line
> 
> twm &
> 
> xclock -geometry 50x50-1+1 &
> 
> xterm -geometry 80x50+494+51 &
> 
> xterm -geometry 80x20+494-0 &
> 
> exec xterm -geometry 80x66+0+0 -name login
> 
> add
```
exec startxfce4
```
```
ctrl + x
```
```
y
```
```
chmod 755 -R /etc/X11
```
```
vncserver
```
> connect with vnc viewer
> localhost:1
> 
> disconnect vnc
```
vncserver -kill :1
```
# Reference
[Here](https://github.com/Neo-Oli/termux-ubuntu)
