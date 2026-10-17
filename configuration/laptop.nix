{ pkgs, ... }:
{
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Brightness control CLI (`light` was removed from nixpkgs, unmaintained upstream)
  users.users.arek.extraGroups = [ "video" ];
  environment.systemPackages = [ pkgs.brightnessctl ];

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandleLidSwitch = "suspend";
  };
}

