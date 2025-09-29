# dotfiles

## Install chezmoi and apply dotfiles

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply josephtole
```

## Testing in a container

### Debian container

Run the below commands from inside the repository.

#### Start container

```bash
podman run -it --rm -v "${PWD}:/workspace:Z" debian:bookworm /bin/bash
```

#### Setup from root user

```bash
time (
  apt update && apt install -y curl sudo git procps build-essential tar xz-utils file \
    findutils python3 locales bsdmainutils
  sudo sed -i 's/^# *en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
  sudo locale-gen en_US.UTF-8
  sudo update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  echo 'export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8'  | tee -a /etc/environment /etc/profile
  useradd -m -s /bin/bash tester
  mkdir -p /home/tester/.local/share
  cp -a /workspace /home/tester/.local/share/chezmoi
  chown -R tester /home/tester/.local
  echo 'tester ALL=(ALL) NOPASSWD: ALL' | tee /etc/sudoers.d/tester
  chmod 0440 /etc/sudoers.d/tester
)
sudo -u tester -i
```

#### Setup from tester user

```bash
cd ${HOME}/.local/share/chezmoi
time sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="~/.local/bin:$PATH"
eval "$(uv generate-shell-completion bash)"
tmux
```
