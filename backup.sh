#!/bin/bash
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > pkglist.txt
pacman -Qqm > pkglistAUR.txt
cp -r ~/Pictures .
cp -r ~/.zshrc ~/.zshenv ~/.vimrc ~/.xinitrc ~/.xprofile ~/.themes ~/.local/share/icons /etc/modprobe.d .
cp -r ~/.config/nvim .
cp -r ~/.config/i3 .
cp -r ~/.config/polybar .
cp -r /etc/X11/xorg.conf.d .
cp -r ~/.config/picom .
cp ~/.config/mimeapps.list .
