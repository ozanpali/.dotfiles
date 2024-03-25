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

# Iterate over each dotfile
for dotfile in "${DOTFILES[@]}"; do
    # Check if the dotfile exists
    if [ -e "${HOME}/${dotfile}" ]; then
        # Move existing dotfile to backup directory
        mv "${HOME}/${dotfile}" "${BACKUP_DIR}/"
    fi
    
    # Create symbolic link to the dotfile in the dotfiles directory
    ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done