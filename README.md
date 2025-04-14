# Dot-Nix

NixOS configuration that I use on my PC and laptop

## Install

```bash
sudo nixos-rebuild switch --flake ~/dot-nix
```

### Home Manager on Non-NixOS Linux

#### Home Manager Installation

Add channel:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

Add experimental features in `nix.conf`:

```bash
mkdir ~/.config/nix -p
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Install `home-manager`:

```bash
nix profile install home-manager
```

#### Apply

```bash
home-manager switch --flake .#arek@toaster
```

#### Fixes

Disable AppArmor's restriction on unprivileged user namespaces (enabled by default on 24.04):

```bash
echo "kernel.apparmor_restrict_unprivileged_userns = 0" | sudo tee /etc/sysctl.d/99-nix-sandbox.conf
```
