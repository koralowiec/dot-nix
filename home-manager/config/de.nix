# Configuration for graphical programs 
# which may be considered as part of a Deskop Environment

{ config, lib, pkgs, ... }: 
let 
in
{
  imports = [
    ./xfce-terminal/xfce-terminal.nix
  ];

  home.packages = [ 
    pkgs.arandr
    pkgs.evince
    pkgs.feh
    pkgs.flameshot
    pkgs.networkmanagerapplet
    pkgs.pavucontrol
    pkgs.rhythmbox
    pkgs.xdotool
  ];
  
  # wayland.windowManager.hyprland.enable = true;

  services.dunst = {
    enable = true;
  };

  services.picom = {
    enable = true;

    fade = true;
    fadeDelta = 7;
    fadeSteps = [
      0.03
      0.03
    ];

    settings = {
      backend = "glx";
      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
      vsync = true;
      xrender-sync-fence = "true";
      glx-swap-method = -1;
      blur = {
        method = "none";
      };
    };
  };

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
  };

  programs.rofi = {
    enable = true;
    # https://github.com/catppuccin/rofi/blob/main/basic/.config/rofi/config.rasi
    extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Oranchelo";
      show-icons = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = " App";
      display-run = " Run";
      display-window = " Window";
      display-Network = " Network";
      sidebar-mode = true;
    };
    terminal = "\${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal";
    # https://github.com/catppuccin/rofi/blob/main/basic/.local/share/rofi/themes/catppuccin-frappe.rasi
    theme =
      let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; =&gt; foo: "abc";
        #   bar = mkLiteral "abc"; =&gt; bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          bg-col = mkLiteral "#303446";
          bg-col-light = mkLiteral "#303446";
          border-col = mkLiteral "#303446";
          selected-col = mkLiteral "#303446";
          blue = mkLiteral "#81c8be";
          fg-col = mkLiteral "#c6d0f5";
          fg-col2 = mkLiteral "#ca9ee6";
          grey = mkLiteral "#737994";

          width = 600;
          font = "JetBrainsMono Nerd Font 14";
        };

        "element-icon, element-text, mode-switcher" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "window" = {
          height = mkLiteral "360px";
          border = mkLiteral "3px";
          border-color = mkLiteral "@border-col";
          background-color = mkLiteral "@bg-col";
        };

        "mainbox" = {
          background-color = mkLiteral "@bg-col";
        };

        "inputbar" = {
          children = mkLiteral "[prompt,entry]";
          background-color = mkLiteral "@bg-col";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "2px";
        };

        "prompt" = {
          background-color = mkLiteral "@blue";
          padding = mkLiteral "6px";
          text-color = mkLiteral "@bg-col";
          border-radius = mkLiteral "3px";
          margin = mkLiteral "20px 0px 0px 20px";
        };

        "textbox-prompt-colon" = {
          expand = mkLiteral "false";
          str = ":";
        };

        "entry" = {
          padding = mkLiteral "6px";
          margin = mkLiteral "20px 0px 0px 10px";
          text-color = mkLiteral "@fg-col";
          background-color = mkLiteral "@bg-col";
        };

        "listview" = {
          border = mkLiteral "0px 0px 0px";
          padding = mkLiteral "6px 0px 0px";
          margin = mkLiteral "10px 0px 0px 20px";
          columns = mkLiteral "2";
          lines = mkLiteral "5";
          background-color = mkLiteral "@bg-col";
        };

        "element" = {
          padding = mkLiteral "5px";
          background-color = mkLiteral "@bg-col";
          text-color = mkLiteral "@fg-col  ";
        };

        "element-icon" = {
          size = mkLiteral "25px";
        };


        "element selected" = {
          background-color = mkLiteral "@selected-col";
          text-color = mkLiteral "@fg-col2";
        };

        "mode-switcher" = {
          spacing = mkLiteral "0";
        };

        "button" = {
          padding = mkLiteral "10px";
          background-color = mkLiteral "@bg-col-light";
          text-color = mkLiteral "@grey";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.5";
        };

        "button selected" = {
          background-color = mkLiteral "@bg-col";
          text-color = mkLiteral "@blue";
        };

        "message" = {
          background-color = mkLiteral "@bg-col-light";
          margin = mkLiteral "2px";
          padding = mkLiteral "2px";
          border-radius = mkLiteral "5px";
        };

        "textbox" = {
          padding = mkLiteral "6px";
          margin = mkLiteral "20px 0px 0px 20px";
          text-color = mkLiteral "@blue";
          background-color = mkLiteral "@bg-col-light";
        };
      };
  };
}
