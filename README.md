# dotfiles

## Install chezmoi and apply dotfiles

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply josephtole`

## Testing in a container

### Debian container

Run the below commands from inside the repository.

#### Start container
```bash
podman run -it --rm -v "${PWD}:/workspace:Z" debian:bookworm /bin/bash
```

#### Setup from root user
```bash
apt update && apt install -y curl sudo git procps build-essential tar xz-utils file \
  findutils
useradd -m -s /bin/bash tester
mkdir -p /home/tester/.local/share
cp -av /workspace /home/tester/.local/share/chezmoi
chown -R tester /home/tester/.local
echo 'tester ALL=(ALL) NOPASSWD: ALL' | tee /etc/sudoers.d/tester
chmod 0440 /etc/sudoers.d/tester
sudo -u tester -i
```

#### Setup from tester user
```bash
cd ${HOME}/.local/share/chezmoi
time sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply
```
