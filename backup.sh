#!/bin/bash
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > pkglist.txt
pacman -Qqm > pkglistAUR.txt
cp -r ~/Pictures .
cp -r ~/.zshrc ~/.vimrc ~/.xinitrc ~/.xprofile ~/.local/share/icons .
cp -r ~/.config/nvim .
cp -r ~/.config/i3 .
cp -r ~/.config/polybar .
cp -r /etc/X11/xorg.conf.d .
cp -r ~/.config/picom .
cp ~/.config/mimeapps.list .
cp -r ~/.config/dunst .
cp ~/.Xresources .
cp -r ~/.config/rofi .
cp -r /etc/conf.d/tpacpi .
