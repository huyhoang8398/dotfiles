#!/bin/bash

#rofi \
#    -show window  \
#    -kb-cancel "Alt+Escape,Escape" \
#    -kb-accept-entry "!Alt-Tab,Return"\
#    -kb-row-down "Alt+Tab,Alt+Down" \
#    -kb-row-up "Alt+Shift+Tab,Alt+Up"&
#xdotool keyup Tab
#xdotool keydown Tab


rofi -modi window -show window -hide-scrollbar -padding 50 -line-padding 4 -auto-select \
  -kb-cancel "Alt+Escape,Escape" \
  -kb-accept-entry "!Alt-Tab,!Alt+Alt_L,Return"\
  -kb-row-down "Alt+Tab,Alt+Down" \
  -kb-row-up "Alt+ISO_Left_Tab,Alt+Up" &
  xdotool search --sync --class Rofi keyup --delay 0 Tab & 
  xdotool key --delay 0 Tab &
