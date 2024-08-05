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
}

