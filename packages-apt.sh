#!/bin/bash
# Must be run as superuser

# Required for kernel compilation
apt install -y sudo git build-essential net-tools \
	openssh-server bc python bison flex libelf-dev libssl-dev \
	libncurses-dev dwarves

# Needed for kernel module development
apt install -y linux-headers-`uname -r`

# Required for vim
apt install -y vim-gtk clang cmake curl python3 python3-dev

echo
echo
echo
echo "Choose vim-gtk"
echo
echo
echo
update-alternatives --config vim
