#!/bin/bash

# Neovim - experimental
mkdir -p /tmp/neovim-setup
cd /tmp/neovim-setup
wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
rsync -av --no-o --no-g ./nvim-linux64/* ~/.local/
