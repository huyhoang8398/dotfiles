#!/bin/bash
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > pkglist.txt
pacman -Qqm > pkglistAUR.txt
cp -r ~/Pictures .
cp -r ~/.zshrc  ~/.vimrc ~/.xinitrc ~/.xprofile ~/.themes ~/.local/share/icons .
cp -r ~/.config/nvim .
cp -r ~/.config/i3 .
cp -r ~/.config/polybar .
cp /etc/X11/xorg.conf.d/30-touchpad.conf .
cp -r ~/.config/picom .
cp ~/.config/mimeapps.list .
