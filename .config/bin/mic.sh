#!/bin/sh
pactl set-source-mute @DEFAULT_SOURCE@ toggle &&
notify-send -i mic-off "Microphone Toggled"
