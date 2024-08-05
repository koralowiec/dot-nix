{ config, lib, pkgs, ... }:
{
  # Hostname
  networking.hostName = "toaster";

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}

