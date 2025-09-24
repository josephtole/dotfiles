# dotfiles

## Install chezmoi and apply dotfiles

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply josephtole`

## Testing in a container

### Debian

Run the below commands from inside the repository.

```bash
podman run -it --rm -v "${PWD}:/workspace:Z" debian:bookworm /bin/bash
apt update && apt install -y curl sudo git procps
useradd -m -s /bin/bash tester
mkdir -p /home/tester/.local/share
cp -av /workspace /home/tester/.local/share/chezmoi
chown -R tester /home/tester/.local
sudo -u tester -i
cd ${HOME}/.local/share/chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply
```
