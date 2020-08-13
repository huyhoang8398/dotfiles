## Note 
To make audio work on Archlinux
```bash
yay -S pulseaudio-git
sudo pacman -S pulseaudio-alsa --assume-installed pulseaudio
```

Socket is enabled by default:
```bash
systemctl --user status pulseaudio.socket
```
If you want pulseaudio to start right after login:
```bash
systemctl --user enable pulseaudio
```

