# dotfiles

## Install chezmoi and apply dotfiles

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply josephtole`

## Testing in a container

### Debian

```bash
podman run -it --rm debian
apt update && apt install -y curl sudo git
useradd -m -s /bin/bash tester
sudo -u tester -i
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply josephtole
```
