# Dot-Nix

NixOS configuration that I use on my PC and laptop

## Install

```bash
sudo nixos-rebuild switch --flake ~/dot-nix
```

## Install from scratch

Using `microwave` as an example.
Its disk layout is declared in `disko/microwave.nix`, so set `device` there to the target drive's
`/dev/disk/by-id/...` path first.
**Disko wipes that disk.**

Boot the NixOS installer, connect to the network, then clone the repo:

```bash
git clone <repo-url> dot-nix && cd dot-nix
```

Write the LUKS passphrase that disko reads (no trailing newline):

```bash
echo -n 'passphrase' > /tmp/secret.key
```

Partition, format and mount everything under `/mnt`:

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake .#microwave
```

Generate the hardware config without filesystems (they come from disko), and
compare it with `hardware-configuration/microwave.nix`, updating it if needed:

```bash
sudo nixos-generate-config --no-filesystems --root /mnt --show-hardware-config
```

Flakes only see tracked files, so `git add` any new files, then install:

```bash
sudo nixos-install --flake .#microwave --no-root-passwd
```

Set the user password:

```bash
sudo nixos-enter --root /mnt -c 'passwd arek'
```

Then reboot.
