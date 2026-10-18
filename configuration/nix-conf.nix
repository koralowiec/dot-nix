{ ... }:
{
  # Enable nix and flakes
  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    trusted-users = [
      "root"
      "arek"
    ];
  };

  # Builds only get CPU and disk time nothing else wants, so the desktop stays
  # responsive during rebuilds
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";
}

