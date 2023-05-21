#!/bin/bash
# Must be run as superuser

apt install -y sudo git openssh-server

## Kernel Development
apt install -y build-essential net-tools bison flex libelf-dev libssl-dev
    libncurses-dev dwarves bc

apt install -y linux-headers-`uname -r`

## Python because Python
apt install python3 python3-dev python3-pip

## Editing Environment
# Required for vim
apt install -y vim cmake curl

# tmux and other management
apt install -y tmux

echo
echo
echo "Install latest version of clangd and use update-alternatives:"
echo "sudo update-alternatives --install /usr/bin/clangd clangd" \
     "/usr/bin/clangd-## 100"
echo
echo

