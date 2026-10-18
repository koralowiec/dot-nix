{ config, lib, pkgs, ... }:
let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    # `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit"
    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'
  '';
in
{
  security.polkit.enable = true;

  # services.xserver.displayManager.sessionPackages = with pkgs; [ sway ];
  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # programs.sway already routes ScreenCast/Screenshot to the "wlr" backend
  # when XDG_CURRENT_DESKTOP=sway; this just makes sure that backend is
  # actually installed. xdg.portal.enable and the gtk fallback come from
  # the GNOME module.
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

  environment.systemPackages = with pkgs; [
    swayidle
    swaylock
    waybar
    fuzzel
    swaynotificationcenter
    libnotify # notify-send
  ];

#   services.greetd = {
#     enable = true;
#     settings = {
#       default_session = {
#         command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
#       };
#     };
#   };
# 
#   environment.etc."greetd/environments".text = ''
#     sway
#     bash
#   '';
}
