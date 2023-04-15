#!/bin/sh
~/.config/defaultScreenLayout.sh &
picom --vsync -b &
feh --bg-fill ~/Pictures/forest-4k-desktop-background-hd-wallpaper-c816fdd8e0505ca8000cb11eb862c48a.jpg &
dunst &
killall volumeicon & 
volumeicon & 
nm-applet & 
~/.config/polybar/launch.sh

