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

# Determine architecture
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    GOOSE_ARCH="x86_64-unknown-linux-gnu"
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    GOOSE_ARCH="aarch64-unknown-linux-gnu"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Install Goose directly to /usr/local/bin
echo "Installing Goose for $GOOSE_ARCH..."
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download the Goose binary
echo "Downloading Goose..."
curl -fsSL "https://github.com/block/goose/releases/download/stable/goose-${GOOSE_ARCH}.tar.bz2" -o goose.tar.bz2

# Extract and install
echo "Extracting and installing Goose..."
tar -xjf goose.tar.bz2
cp goose /usr/local/bin/
chmod +x /usr/local/bin/goose

# Clean up
cd - > /dev/null
rm -rf "$TEMP_DIR"

# Verify installation
if command -v goose >/dev/null 2>&1; then
    echo "Block Goose installation completed"
    goose --version
else
    echo "Block Goose installation failed"
    exit 1
fi