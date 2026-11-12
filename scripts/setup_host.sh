#!/usr/bin/env bash

set -euo pipefail

echo "Setting up fresh Linux based home server"

#0. Run needed hardware config
# chmod +x hardware_config.sh
# ./hardware_config.sh

#1. Install git if I manually copied the directory
if ! command -v git >/dev/null 2>&1; then
	echo "git not found, installing..."
	sudo apt update 
	sudo apt install git -y
fi

#2. Install Docker & Compose 
if ! command -v docker &>/dev/null || !docker compose version &>/dev/null; then
        echo "docker or docker compose not found, installing..."
	chmod +x docker_install.sh
        ./docker_install.sh
fi

#3 Copying my homeserver apps files into the host and launching the apps
mkdir -p ~/homeserver-apps
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ls -la
cp -rai "$SCRIPT_DIR/../docker-compose.yml" "$SCRIPT_DIR/../apps/" ~/homeserver-apps/
cd ~/homeserver-apps
docker compose config
echo "Everythinh has been configured. Fill the needed .env files then run `docker compose up -d --build`"
#docker compose up -d --build
