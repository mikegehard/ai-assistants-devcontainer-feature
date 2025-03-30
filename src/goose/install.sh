#!/bin/sh
set -e

echo "Activating feature Goose"

apt-get update -y
if ! command -v curl > /dev/null; then
    echo "Installing curl..."
    apt-get install -y curl
fi
if ! command -v bzip2 > /dev/null; then
    echo "Installing bzip2..."
    apt-get install -y bzip2
fi

# Required by Goose
apt-get install -y libxcb1 libdbus-1-3

# Install Goose
curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash

# Add symlink to system PATH
ln -sf "${HOME}/.local/bin/goose" /usr/local/bin/goose

# Verify installation
if [ -x "$(command -v goose)" ]; then
    echo "Block Goose installation completed"
    goose --version
else
    echo "Block Goose installation failed"
    exit 1
fi