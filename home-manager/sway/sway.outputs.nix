{ osConfig, config, ... }:
let
  wallpaperLocation = ".config/wallpapers/nix.png";
  wallpaperUrl = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/refs/heads/main/os/nix-black-4k.png";
  wallpaperSha = "1d165878a0e67c0e7791bddf671b8d5af47c704f7ab4baea3d9857e3ecf89590";
in
{
  home.file."${wallpaperLocation}".source = builtins.fetchurl {
    url = wallpaperUrl;
    sha256 = wallpaperSha;
  };
      
  # Output based on hostname
  wayland.windowManager.sway.config.output =
    if osConfig.networking.hostName == "microwave"
    then {
        "*" = {
          background = "${config.home.file."${wallpaperLocation}".source} fill";
        };
        "HDMI-A-1" = {
          mode = "1920x1080@60Hz";
          pos = "0,0";
        };
        "DP-1" = {
          mode = "2560x1080@60Hz";
          pos = "1920,0";
        };
      }
    else {
        "*" = {
          background = "${config.home.file."${wallpaperLocation}".source} fill";
        };
    };
}
