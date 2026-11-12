#!/usr/bin/env bash
set -euo pipefail

echo "Installing Docker CE"

#Removing old and conflicting packages
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc | cut -f1)


# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

#Installing the latest version
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Add user to  docker group
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Veryfying docker and docker compose installation"

if ! command -v docker &>/dev/null; then
        echo "Docker installation failed"
        exit 1
fi
if ! docker compose version &>/dev/null; then
        echo "Docker compose installation failed"
        exit 1
fi

echo "Veryfying Docker is running and starting it if not"
sudo systemctl status docker --no-pager
sudo systemctl start docker

echo "Everything seems to be alright!"
