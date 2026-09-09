#!/bin/bash

# Server setup script - CLI tools only, no GUI applications

# Update system
sudo apt update && sudo apt upgrade -y

# Install git
sudo apt install git -y

# Install fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y
sudo chsh -s /usr/bin/fish

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Create starship config directory
mkdir -p ~/.config
touch ~/.config/starship.toml

# Install eza (ls replacement)
sudo apt install eza -y

# Install Node.js via fnm
curl -fsSL https://fnm.vercel.app/install | bash
fnm use v20

# Install Go
wget https://go.dev/dl/go1.26.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.26.0.linux-amd64.tar.gz
rm go1.26.0.linux-amd64.tar.gz

# Install GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# Install lazygit
go install github.com/jesseduffield/lazygit@latest

echo "Server setup complete!"
