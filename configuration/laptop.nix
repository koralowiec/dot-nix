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

  # TLP tunes power settings per charger/battery state. tlp-pd provides the
  # power-profiles-daemon D-Bus API, so profile switchers (Waybar,
  # powerprofilesctl) keep working.
  services.tlp = {
    enable = true;
    pd.enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 80;
      STOP_CHARGE_THRESH_BAT0 = 85;
    };
  };
  # The GNOME module enables power-profiles-daemon by default, and nixpkgs
  # refuses to combine it with tlp-pd
  services.power-profiles-daemon.enable = false;
}
