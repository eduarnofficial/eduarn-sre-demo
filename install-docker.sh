#!/bin/bash

set -e

echo "======================================"
echo "Removing old Docker installation"
echo "======================================"

sudo apt-get remove -y \
docker \
docker-engine \
docker.io \
containerd \
runc \
docker-ce \
docker-ce-cli \
docker-compose-plugin || true


sudo apt-get autoremove -y


echo "======================================"
echo "Updating Ubuntu"
echo "======================================"

sudo apt update
sudo apt upgrade -y


echo "======================================"
echo "Installing dependencies"
echo "======================================"

sudo apt install -y \
ca-certificates \
curl \
gnupg \
lsb-release


echo "======================================"
echo "Adding Docker GPG key"
echo "======================================"

sudo install -m 0755 -d /etc/apt/keyrings


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor \
-o /etc/apt/keyrings/docker.gpg


sudo chmod a+r /etc/apt/keyrings/docker.gpg


echo "======================================"
echo "Adding Docker repository"
echo "======================================"

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


echo "======================================"
echo "Installing Docker Engine"
echo "======================================"

sudo apt update


sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin


echo "======================================"
echo "Adding user to Docker group"
echo "======================================"

sudo usermod -aG docker $USER


echo "======================================"
echo "Docker Version"
echo "======================================"

docker --version


echo "======================================"
echo "Docker Compose Version"
echo "======================================"

docker compose version


echo "======================================"
echo "Testing Docker"
echo "======================================"

sudo docker run hello-world


echo "======================================"
echo "INSTALLATION COMPLETE"
echo "======================================"

echo "Close Ubuntu terminal and open again."
echo "Then test:"
echo "docker ps"
echo "docker compose version"
