{ pkgs, ... }:
{
  # CLI tools that should always be available at the system level,
  # regardless of whether home-manager is wired up for a given host.
  environment.systemPackages = with pkgs; [
    git
    neovim
    tmux
  ];
}
