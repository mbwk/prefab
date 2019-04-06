#!/usr/bin/env sh

set -ex

tpldir="$HOME/.local/share/templates/$1/"
echo $tpldir

if [ -d $tpldir ]; then
    for tpl in $tpldir/*; do
        cp -i $tpl .
    done
else
    echo "No template with that name"
fi

