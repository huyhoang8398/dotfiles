#!/bin/bash
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > pkglist.txt
pacman -Qqm > pkglistAUR.txt
cp -r ~/Pictures .
cp ~/.zshrc .
cp ~/.zshenv .
cp ~/.xprofile .
cp -r ~/.config/nvim .
cp -r ~/.config/i3 .
cp -r /etc/X11/xorg.conf.d .
cp -r ~/.config/picom .
cp ~/.config/mimeapps.list .
cp -r ~/.config/dunst .
cp -r ~/.config/i3blocks .
