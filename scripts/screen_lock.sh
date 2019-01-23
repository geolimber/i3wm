#!/usr/bin/env bash
# This script is blur content of your screen making it no readable and then locks your screen

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/Imágenes/lock-icon-light.png"
tmpbg='/tmp/screen.png'

# take a screenshot
scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
#convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"
convert "$tmpbg" -channel RGBA  -blur 0x6 "$tmpbg"

# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
i3lock -i "$tmpbg"
