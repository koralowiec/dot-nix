{ pkgs, ... }:
{
  # Option from the upstream Handy flake's NixOS module
  programs.handy.enable = true;

  environment.systemPackages = with pkgs; [
    # Used by Handy to type text on Wayland
    wtype
  ];
}
