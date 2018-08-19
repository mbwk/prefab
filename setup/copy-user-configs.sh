#!/usr/bin/env sh

set -x

DOTFILES="zshrc xinitrc Xdefaults"
for dotfile in $DOTFILES; do
    cp -riv ./dotfiles/user/${dotfile} ~/.${dotfile}
done

mkdir -p ~/.config/
XDGCONF="i3 i3status mpd mpv nvim sway termite"
for xconf in $XDGCONF; do
    cp -riv ./dotfiles/user/${xconf} ~/.config/
done

