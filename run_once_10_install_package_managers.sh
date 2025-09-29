#!/bin/bash

# Install uv, uvx
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="${HOME}/.local/bin:${PATH}"

# Install Ansible
"${HOME}/.local/bin/uv" tool install ansible --with-executables-from ansible-core,ansible-lint

# Install Homebrew
# [[ -d "${HOME}/.local/homebrew" ]] || git clone https://github.com/Homebrew/brew.git ~/.local/homebrew
# eval "$(${HOME}/.local/homebrew/bin/brew shellenv)"
# export NONINTERACTIVE=1 CI=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo chown -R "$USER" /home/linuxbrew/
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
