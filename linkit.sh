#!/bin/bash

# Specify the directory where dotfiles are located
# You can change this to match the path of your dotfiles directory
DIR="$HOME/.dotfiles"

declare -a DOTFILES=(
    ".vimrc"
    ".bashrc"
    ".gitconfig"
    #".bash_profile"
    #".profile"
    #".local/share/fonts"
)

# Iterate over each dotfile and create symbolic links if they don't exist
for dotfile in "${DOTFILES[@]}"; do
    if [ ! -e "${HOME}/${dotfile}" ]; then
        ln -s "${DIR}/${dotfile}" "${HOME}/${dotfile}"
    else
        echo "Skipping $dotfile. File already exists."
    fi
done