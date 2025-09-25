#!/bin/bash

# Install uv, uvx
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="${HOME}/.local/bin:${PATH}"

# Install Ansible
"${HOME}/.local/bin/uv" tool install ansible --with-executables-from ansible-core,ansible-lint

# Install Homebrew
[[ -d "${HOME}/.local/homebrew" ]] ||git clone https://github.com/Homebrew/brew.git ~/.local/homebrew
# eval "$(${HOME}/.local/homebrew/bin/brew shellenv)"
