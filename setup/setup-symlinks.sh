#!/usr/bin/env sh

set -ex

# This must be run from the root directory of `prefab`


# symlink our configurations
DOTFILES="zshrc.local xinitrc Xdefaults gtkrc-2.0 sbclrc guile emacs.d"
for dotfile in $DOTFILES; do
    if [ -h ~/.${dotfile} ]; then
        # a symlink is already there
        echo "symlink present"
    elif [ -d ~/.${dotfile} ]; then
        rm -ri ~/.${dotfile}
    fi
    ln -srfiv ./dotfiles/user/${dotfile} ~/.${dotfile}
done

mkdir -p ~/.config/
XDGCONF="i3 i3status mpd mpv nvim sway termite user-dirs.dirs gtk-3.0"
for xconf in $XDGCONF; do
    if [ -h ~/.config/${xconf} ]; then
        # a symlink is already there
        echo "symlink present"
    elif [ -d ~/.config/${xconf} ]; then
        rm -ri ~/.config/${xconf}
    fi
    ln -srfiv ./dotfiles/user/${xconf} ~/.config/
done


# symlink our scripts
mkdir -p ~/scripts/
for script in ./scripts/*; do
    ln -srfiv $script -t ~/scripts/
done


# symlink some of our other quality-of-life stuff
mkdir -p ~/.local/share/
QOLSTUFF="templates startpage"
for qolf in $QOLSTUFF; do
    qolshr=".local/share/${qolf}"
    if [ -h ~/$qolshr ]; then
        # a symlink is already there
        echo "symlink present"
    elif [ -d ~/$qolshr ]; then
        # if a directory is already at that location, we need to remove it for
        # ln to proceed
        rm -ri ~/$qolshr
        ln -srfv ./qol/$qolf -t ~/.local/share/ # don't prompt here because we already prompted for removal
    else
        ln -srfiv ./qol/$qolf -t ~/.local/share/
    fi
done

