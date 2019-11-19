#!/bin/bash

cd $(dirname $0)
DOTFILES_DIR=$(pwd)


links=(
    ".bash_profile ~/"
    ".bash_rc ~/"
    ".vimrc ~/"
    ".vim ~/"

    "config_fish ~/.config/fish"
    "config_fisher ~/.config/fisher"
)

for link in "${links[@]}"; do
    from="${DOTFILES_DIR}/${link%% *}"
    to="${link#* }"
    if [ "${to##*/}" = "" ]; then
        to="${to}${from##*/}"
    fi
    
    if [ "${to%%/*}" = "~" ]; then
        to="${HOME}/${to#*/}"
    fi

    if [ -e "${to}" ]; then
        echo ${to} is exists. skipping...
    else
        echo link ${from} ${to}
        ln -s ${from} ${to}
    fi
done

