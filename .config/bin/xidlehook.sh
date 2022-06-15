#!/usr/bin/env sh

killall -q xidlehook

while pgrep -u $UID -x xidlehook >/dev/null; do sleep 1; done

xidlehook --not-when-fullscreen --not-when-audio --timer 300 'systemctl suspend' '' &

