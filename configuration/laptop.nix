{ ... }:
{
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable `light` CLI tool for brightness control
  users.users.arek.extraGroups = [ "video" ];
  programs.light.enable = true;

  services.logind = {
    powerKey = "suspend";
    lidSwitch = "suspend";
  };
}

