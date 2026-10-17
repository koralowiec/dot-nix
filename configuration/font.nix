{ pkgs, ... }:
{
  # Configure fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

