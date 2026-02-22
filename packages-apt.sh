#!/bin/bash
# Must be run as superuser

# Check for superuser privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

confirm_installation() {
    read -r -p "Do you want to install $1? (y/N) " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

echo "Installing bare essentials..."
apt update
apt install -y sudo git openssh-server
apt install -y python3 python3-dev python3-pip
apt install -y vim cmake curl tmux

if confirm_installation "Linux Development"; then
    apt install -y build-essential net-tools bison flex libelf-dev libssl-dev
        libncurses-dev dwarves bc

    apt install -y linux-headers-`uname -r`
fi

if confirm_installation "Docker"; then
    echo "Installing Docker..."
    # Add Docker's official GPG key:
    apt install -y ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc

    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# Extra suggestions
echo "Setting up clangd (manual step required for alternatives)..."
echo "  (Manual step) Install latest version of clangd and use update-alternatives:"
echo "  sudo update-alternatives --install /usr/bin/clangd clangd \"/usr/bin/clangd-## 100\""

echo "Package installation script finished."
