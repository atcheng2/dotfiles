#!/bin/bash
# Must be run as superuser

apt install -y sudo git openssh-server

# Required for kernel development
apt install -y build-essential net-tools bison flex libelf-dev libssl-dev
    libncurses-dev dwarves bc

# Might not need python2
# apt install -y python

# Needed for kernel module development
apt install -y linux-headers-`uname -r`

## Editing Environment
# Required for vim
apt install -y vim clang cmake cscope curl python3 python3-dev clang-format

# tmux and other management
apt install -y tmux

echo
echo
echo "Choose vim-gtk"
echo
echo
update-alternatives --config vim

echo
echo
echo "Install latest version of clangd and use update-alternatives"
echo
echo
