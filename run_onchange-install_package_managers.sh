#!/bin/bash

export NONINTERACTIVE=1
export HOMEBREW_PREFIX="${HOME}/.homebrew"

# Install uv, uvx
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Ansible
uv tool install ansible --with-executables-from ansible-core,ansible-lint

# Install Homebrew
# export PATH="${HOME}/.local/homebrew/bin:${PATH}"
git clone https://github.com/Homebrew/brew.git ~/.local/homebrew
