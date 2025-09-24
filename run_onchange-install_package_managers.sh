#!/bin/bash

# Install uv, uvx
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Ansible
uv tool install ansible --with-executables-from ansible-core,ansible-lint

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
