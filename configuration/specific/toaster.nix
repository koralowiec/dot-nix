{ config, lib, pkgs, ... }:
{
  # Hostname
  networking.hostName = "toaster";

  # Keep builds from freezing the desktop on this 4-core/8-thread, 8 GB laptop.
  # Defaults are max-jobs = number of threads and cores = 0 (all threads per
  # job), i.e. up to 64 compiler processes at once.
  nix.settings = {
    max-jobs = 2;
    cores = 4;
  };
  # Above this, the kernel throttles and reclaims the daemon's memory (builds
  # slow down) instead of starving the desktop. Not a hard limit, so builds
  # aren't killed.
  systemd.services.nix-daemon.serviceConfig.MemoryHigh = "4G";

  # Compressed swap in RAM, used before the disk swap partition (higher
  # priority by default)
  zramSwap.enable = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}

