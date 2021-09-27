xrdb -merge ~/.config/X11/.Xresources
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&
bindsym $mod+z "setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&"
urxvtd -o -q -f
udiskie &
exec i3

