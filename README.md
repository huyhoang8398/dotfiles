## Preview 
![general](static/demo.png)

## Note 
### To make audio work on Archlinux
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

### TLP, battery threshold 

```bash
sudo pacman -S tlp acpi_call tpacpi-bat
sudo systemctl enable tlp.service
sudo systemctl enable tpacpi-bat
```
Change desire value for battery threshold 
```
sudo nvim /etc/conf.d/tpacpi
reboot
```
Validate:
```bash
sudo tlp-stat -b
```

### Throttling 
Lenovo has confirmed the issue, explained the cause and published updates for the embedded controller and the BIOS to LVFS .
The alternative fix is to install throttled, then run
```bash
sudo pacman -S throttled
sudo systemctl enable --now lenovo_fix.service
```
**testing**
```bash
sudo pacman -S tress
sudo stress --cpu 8 -v --timeout 30s
watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""
```

