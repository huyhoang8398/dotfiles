#!/bin/bash
tray=$(cat ~/.config/polybar/config.ini | grep "tray-position = none")
if [[ $tray == "" ]]; then
	sed -i -e 's/tray-position = .*/tray-position = none/g' ~/.config/polybar/config.ini
else
	sed -i -e 's/tray-position = .*/tray-position = right/g' ~/.config/polybar/config.ini
fi
~/.config/polybar/launch.sh &
