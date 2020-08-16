[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
dunst &
wal -R &
exec i3

