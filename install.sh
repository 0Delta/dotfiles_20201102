#!/bin/bash

cd $(dirname $0)
DOTFILES_DIR=$(pwd)

if [ ! -e "~/.config" ]; then
    mkdir -p ~/.config
fi

links=(
    ".bash_profile ~/"
    ".bashrc ~/"
    ".vimrc ~/"
    ".vim ~/"
    ".tmux.conf ~/"
    "fzf ~/.fzf"

    "config_fish ~/.config/fish"
    "config_fisher ~/.config/fisher"

    ".skk-dic ~/"

    "kubectx ~/.kubectx"
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

mkdir -p ~/.config/fish/completions
ln -s ~/.kubectx/completion/kubectx.fish ~/.config/fish/completions/
ln -s ~/.kubectx/completion/kubens.fish ~/.config/fish/completions/
