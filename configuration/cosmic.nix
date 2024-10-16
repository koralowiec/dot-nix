# https://github.com/lilyinstarlight/nixos-cosmic
{ ... }:
{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
