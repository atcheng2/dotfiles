#!/bin/bash
# Installs symlinks for dotfiles

os=$(uname -s)

dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Linking dotfiles..."

ln -sf "$dir/bash_aliases" ~/.bash_aliases
ln -sf "$dir/bash_extras" ~/.bash_extras
ln -sf "$dir/gitconfig" ~/.gitconfig
ln -sf "$dir/gitignore" ~/.gitignore
ln -sf "$dir/tmux.conf" ~/.tmux.conf

mkdir -p ~/.vim
ln -sf "$dir/vimrc" ~/.vimrc
ln -sf "$dir/vim-extras" ~/.vim/extras

# .config subdirectories
if [[ "$os" == "Linux" ]]; then
    mkdir -p ~/.config
    ln -sf "$dir/config/clangd" ~/.config/clangd
elif [[ "$os" == "Darwin" ]]; then
    ln -sf "$dir/config/clangd" ~/Library/Preferences/clangd
fi

echo "Done"

