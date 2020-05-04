#!/usr/bin/env sh

if [ $# -gt 0 ] && [ $1 == "area" ]; then
    # scrot -s ~/shots/%Y-%m-%d-%T-area-screenshot.png
    # import ~/shots/$(date +"%Y-%m-%d_%H%M%S").png
    flameshot gui -p ~/shots/
else
    # scrot ~/shots/%Y-%m-%d-%T-screenshot.png
    flameshot full -p ~/shots/
fi


