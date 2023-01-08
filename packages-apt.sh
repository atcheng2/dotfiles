#!/bin/bash
# Must be run as superuser

apt install -y sudo git openssh-server

# Required for kernel development
apt install -y build-essential net-tools bison flex libelf-dev \
	libssl-dev libncurses-dev dwarves python bc

# Needed for kernel module development
apt install -y linux-headers-`uname -r`

# Required for vim
apt install -y vim-gtk clang cmake cscope curl python3 python3-dev

echo
echo
echo
echo "Choose vim-gtk"
echo
echo
echo
update-alternatives --config vim
