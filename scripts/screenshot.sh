#!/usr/bin/env sh

if [ $# -gt 0 ] && [ $1 == "area" ]; then
    scrot -s ~/shots/%Y-%m-%d-%T-area-screenshot.png
else
    scrot ~/shots/%Y-%m-%d-%T-screenshot.png
fi


