#!/usr/bin/env sh

# Replace these with your screen resolution
convert -size 1920x1200  plasma:fractal ~/rice/fractal-0.png
convert -size 1440x2560  plasma:fractal ~/rice/fractal-1.png
cp ~/rice/fractal-{1,2}.png
cp ~/rice/fractal-{,lock-}0.png
feh --bg-fill ~/rice/fractal-{0..2}.png

