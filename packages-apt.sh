#!/bin/bash
# Must be run as superuser

# Required for kernel compilation
apt install -y sudo git build-essential net-tools linux-headers-`uname -r` \
	openssh-server bc python bison flex libelf-dev libssl-dev \
	libncurses-dev dwarves

# Required for vim
apt install -y vim-gtk clang cmake curl python3 python3-dev
