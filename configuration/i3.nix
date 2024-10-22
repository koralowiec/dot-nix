{ pkgs, ... }:
{
  services.xserver.windowManager.i3 = {
    package = pkgs.i3-gaps;
    enable = true;
    extraPackages = with pkgs; [
      feh
      i3status
      i3lock
      i3lock-color
      i3blocks
      rofi
    ];
  };
}

