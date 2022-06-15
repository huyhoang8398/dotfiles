#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    pamixer --get-volume
}

function send_notification {
    volume=$(get_volume)
    volume=`get_volume`
    bar=$(seq -s "─" 0 $(($volume / 5)) | sed 's/[0-9]//g')
    if [ "$volume" = "0" ]; then
        icon_name="$HOME/.config/dunst/icons/volume-muted.svg"
        bar=""
    else
        if [  "$volume" -lt "10" ]; then
            icon_name="$HOME/.config/dunst/icons/volume-low.svg"
        else
            if [ "$volume" -lt "30" ]; then
                icon_name="$HOME/.config/dunst/icons/volume-low.svg"
            else
                if [ "$volume" -lt "70" ]; then
                    icon_name="$HOME/.config/dunst/icons/volume-medium.svg"
                else
                    icon_name="$HOME/.config/dunst/icons/volume-high.svg"
                fi
            fi
        fi
    fi
    # Send the notification
    # dunstify " Volume " "$bar" -i $icon_name -r 5555 -u normal
    dunstify "Volume $volume% " -i $icon_name -r 5555 -u normal -h int:value:$(($volume))
    # notify-send.sh "Volume : $volume" -i "$icon_name" -t 2000 --replace=555
}

case $1 in
    up)
        # Set the volume on (if it was muted)
        pamixer --unmute
        pamixer -i 5
        send_notification
    ;;
    down)
        pamixer --unmute
        pamixer -d 5
        send_notification
    ;;
    mute)
        # Toggle mute
        pamixer -t
        mute=$(pamixer --get-mute)
        if [[ $mute == "true" ]]; then
            icon_name="$HOME/.config/dunst/icons/volume-muted.svg"
            dunstify "Mute" -i $icon_name -r 5555 -u normal -h int:value:0
        else
            send_notification
        fi
    ;;
    mic)
        # Toggle mic
        pamixer --default-source -t
        mic_mute=$(pamixer --default-source --get-mute)
        if [[ $mic_mute == "true" ]]; then
          dunstify "Microphone off" -i mic-off -r 5555 -u normal
        else
          dunstify "Microphone on" -i audio-input-microphone -r 5555 -u normal
        fi
    ;;
esac
