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
``````
pkg install proot wget pulseaudio termux-api curl termux-x11 -y
```
```
termux-setup-storage
```
> Allow
**ROOTFS**
Manjaro
> Setup
```
wget raw.githubusercontent.com/shiru-ri/playme/main/setupmanjaro.sh && bash setupmanjaro.sh
```
> Remove
```
wget raw.githubusercontent.com/shiru-ri/playme/main/removemanjaro.sh && bash removemanjaro.sh
```
# Reference
[Here](https://github.com/Neo-Oli/termux-ubuntu)
