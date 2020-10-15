#!/bin/bash
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > pkglist.txt
pacman -Qqm > pkglistAUR.txt
cp -r ~/Pictures .
cp -r ~/.zshrc ~/.xprofile .
cp -r ~/.config/nvim .
cp ~/.config/mimeapps.list .
