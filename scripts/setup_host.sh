#!/usr/bin/env bash

set -euo pipefail

echo "Setting up fresh Linux based home server"

#0. Disable laptop sleep on lid close
### TO-DO ###

#1. Install git if not already there
if ! command -v git >/dev/null 2>&1; then
	echo "git not found, installing..."
	sudo apt update 
	sudo apt install -y
fi

#2. Install Docker & Compose 
if ! command -v docker &>/dev/null || !docker compose version &>/dev/null; then
        echo "docker or docker compose not found, installing..."
	chmod +x docker_install.sh
        ./docker_install.sh
fi
