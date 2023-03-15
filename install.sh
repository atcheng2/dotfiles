#!/bin/bash
# Installs symlinks for dotfiles

dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Linking dotfiles..."

ln -sf "$dir/vimrc" ~/.vimrc
ln -sf "$dir/light.vim" ~/.light.vim
ln -sf "$dir/bash_aliases" ~/.bash_aliases
ln -sf "$dir/gitconfig" ~/.gitconfig
ln -sf "$dir/gitignore" ~/.gitignore
ln -sf "$dir/tmux.conf" ~/.tmux.conf

# .config subdirectories
mkdir -p ~/.config
sudo rm -rf ~/.config/clangd
ln -sf "$dir/config/clangd" ~/.config/clangd

sudo rm -rf ~/.config/nvim
ln -sf "$dir/config/nvim" ~/.config/nvim

echo "Done"
