{ pkgs, lib, osConfig, ... }: 
let 
  defaultTerminal = "alacritty";
  modifier = "Mod4";
  alt = "Mod1";
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  menuBin = "${pkgs.rofi-wayland}/bin/rofi";
  browserBin = "${pkgs.firefox}/bin/firefox";
in
{
  wayland.windowManager.sway = {
    swaynag.enable = true;
    enable = true;
    config = {
      modifier = modifier;
      terminal = defaultTerminal; 
      menu = menuBin;

      startup = [
        { command = "${pkgs.obsidian}/bin/obsidian"; always = true; }
        { command = "${pkgs.pavucontrol}/bin/pavucontrol"; always = true; }
        { command = "${pkgs.blueman}/bin/blueman-manager"; always = true; }
        { command = browserBin; }
      ];

      gaps = {
        inner = 4;
        outer = 4;
        smartBorders = "on";
        smartGaps = true;
      };
      workspaceAutoBackAndForth = true;
      focus = {
        followMouse = "no";
      };
      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
        # Identifier from `swaymsg -t get_inputs`
        "1:1:AT_Translated_Set_2_keyboard" = {
          # Set keyboard layout to Polish
          xkb_layout = "pl";
          # Enable compose key for Caps Lock
          # xkb_options = "compose:caps";
        };
      };

      # Output based on hostname
      output = if osConfig.networking.hostName == "microwave"
        then {
           "HDMI-A-1" = {
             mode = "1920x1080@60Hz";
             pos = "0,0";
           };
           "DP-1" = {
             mode = "2560x1080@60Hz";
             pos = "1920,0";
           };
         }
        else {};

      workspaceOutputAssign = [
      {
        workspace = "1";
        output = "primary";
      }
      {
        workspace = "2";
        output = "primary";
      }
      {
        workspace = "3";
        output = "primary";
      }
      {
        workspace = "4";
        output = "primary";
      }
      {
        workspace = "5";
        output = "primary";
      }
      {
        workspace = "6";
        output = "primary";
      }
      {
        workspace = "7";
        output = "primary";
      }
      {
        workspace = "8";
        output = "primary";
      }
      {
        workspace = "9";
        output = "primary";
      }
      {
        workspace = "10:NOTES";
        output = "primary";
      }
    ];

      keybindings = {
        # Exit sway (logs you out of your Wayland session)
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        # Reload the configuration file
        "${modifier}+Shift+r" = "reload";
        # Kill focused window
        "${modifier}+Shift+q" = "kill";
        # Lock 
        "${alt}+Ctrl+semicolon" = "exec swaylock";
        "${modifier}+Escape" = "exec swaylock";
        # Sleep
        "Ctrl+${alt}+s" = "exec systemctl suspend";

        # Modes / layouts
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        ## Tiling/toggle split
        "${modifier}+e" = "layout toggle split";
        ## Floating mode
        "${modifier}+Shift+Space" = "floating toggle";
        ## Scratchpad
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

        # Keyboard layout
        "${modifier}+BackSpace" = "input \"1:1:AT_Translated_Set_2_keyboard\" xkb_switch_layout next";

        # Moving around
        ## Move your focus with hjlk
        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";
        ### With arrow keys
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        ## Move the focused window with the same, but add Shift
        "${modifier}+Shift+${left}" = "focus left";
        "${modifier}+Shift+${down}" = "focus down";
        "${modifier}+Shift+${up}" = "focus up";
        "${modifier}+Shift+${right}" = "focus right";
        ### With arrow keys
        "${modifier}+Shift+Left" = "focus left";
        "${modifier}+Shift+Down" = "focus down";
        "${modifier}+Shift+Up" = "focus up";
        "${modifier}+Shift+Right" = "focus right";

        ## Move workspace
        "${modifier}+n" = "move workspace to output left";
        "${modifier}+m" = "move workspace to output right";
        ## Focus on monitor on left/right
        "${modifier}+Tab" = "focus output left";
        "${alt}+Tab" = "focus output right";

        # Workspaces
        ## Switch to workspace
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number $ws10";
        "${modifier}+comma" = "workspace number $ws11";
        "${modifier}+period" = "workspace number 12";
        "${modifier}+slash" = "workspace number 13";
        "${modifier}+semicolon" = "workspace number 14";
        "${modifier}+apostrophe" = "workspace number 15";
        ## Move focused container to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        "${modifier}+Shift+comma" = "move container to workspace number $ws11";
        "${modifier}+Shift+period" = "move container to workspace number 12";
        "${modifier}+Shift+slash" = "move container to workspace number 13";
        "${modifier}+Shift+semicolon" = "move container to workspace number 14";
        "${modifier}+Shift+apostrophe" = "move container to workspace number 15";
	## Switch to prev/next workspace
        "${alt}+Ctrl+z" = "workspace prev";
        "${alt}+Ctrl+x" = "workspace next";
        "${alt}+Ctrl+h" = "workspace prev";
        "${alt}+Ctrl+l" = "workspace next";
        "${alt}+Ctrl+Left" = "workspace prev";
        "${alt}+Ctrl+Right" = "workspace prev";

	# App launcher
        # "${modifier}+d" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun";
        "${modifier}+Space" = "exec ${menuBin} -show drun -drun-display-format \" {name}\" -show-icons";

        # Apps
        "${modifier}+Shift+Return" = "exec ${pkgs.firefox}/bin/firefox";
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+x" = "exec ${pkgs.nemo}/bin/nemo";
        "${modifier}+Shift+S" = "exec ${pkgs.flameshot}/bin/flameshot gui";
        "${alt}+Return" = "exec ${pkgs.planify}/bin/io.github.alainm23.planify.quick-add";

        # Media
        "${modifier}+Shift+z" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ 1";
        "${modifier}+Shift+x" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ 0";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
        "XF86AudioPlay" = "exec playerctl play-pause";

        # Action buttons
        # "" = "exec ";
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 10";
        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 10";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1";
      };

      assigns = {
        "11:NOTES" = [{
          class = "obsidian";
        }];
        "14" = [{
          app_id = ".blueman-manager-wrapped";
        }
        {
          app_id = "org.pulseaudio.pavucontrol";
        }];
      };

      window = {
        commands = [
          {
            command = "floating enable";
            criteria = {
              class = "io.github.alainm23.planify.quick-add";
            };
          }
          {
            command = "border pixel 0";
            criteria = {
              class = "io.github.alainm23.planify.quick-add";
            };
          }
        ];
      };

      colors = {
      	background = "$base";
	focused = {
          childBorder = "$lavender";
	  background = "$base";
	  text = "$text";
	  indicator = "$rosewater";
	  border = "$lavender";
	};
	focusedInactive = {
          childBorder = "$overlay0";
	  background = "$base";
	  text = "$text";
	  indicator = "$rosewater";
	  border = "$overlay0";
	};
	placeholder = {
          childBorder = "$overlay0";
	  background = "$base";
	  text = "$text";
	  indicator = "$base";
	  border = "$base";
	};
	unfocused = {
          childBorder = "$overlay0";
	  background = "$base";
	  text = "$text";
	  indicator = "$overlay0";
	  border = "$overlay0";
	};
	urgent = {
          childBorder = "$peach";
	  background = "$base";
	  text = "$peach";
	  indicator = "$overlay0";
	  border = "$peach";
	};
      };

      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];
    };

    extraConfigEarly = ''
      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      set $ws6 "6"
      set $ws7 "7"
      set $ws8 "8"
      set $ws9 "9"
      set $ws10 "10"
      set $ws11 "11:NOTES"
      set $ws12 "12"
      set $ws13 "13"
      set $ws14 "14"
    '';

    extraConfig = ''
      bindgesture swipe:3:right workspace prev
      bindgesture swipe:3:left workspace next
      bindgesture swipe:3:down exec ${menuBin} -show drun -show-icons
      bindgesture swipe:3:up exec ${menuBin} -show window -show-icons -window-format "  {t}"
      # bindgesture swipe:3:down exec swaymsg workspace $(($(swaymsg -t get_workspaces | tr , '\n' | grep '"num":' | grep -v '11\|12' | cut -d : -f 2 | sort -rn | head -1) + 1))
      bindgesture hold:3 workspace number $ws11

      # Backlight adjustment
      bindgesture swipe:4:up exec ${pkgs.light}/bin/light -A 10
      bindgesture swipe:4:down exec ${pkgs.light}/bin/light -U 10

      # Workaround to remove the top title bar
      default_border pixel 2
      default_floating_border pixel 2

      # Tab mode by default
      for_window [workspace="14"] layout tabbed
    '';
  };

  programs.swaylock = {
    enable = true;
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        modules-left = ["sway/workspaces" "sway/mode"];
        modules-center = [ ];
        modules-right = [
          "bluetooth"
          "network"
          "pulseaudio#microphone"
          "custom/audio-primary"
          "backlight"
          "battery"
          "clock#date"
          "clock#time"
          "tray"
        ];
	      spacing = 10;

        "network" = {
          format = "{icon}";
          format-disconnected = "󱛅 ";
          format-wifi = "󰖩 ";
          format-ethernet = "󰈀 ";
          tooltip = true;
          tooltip-format-ethernet = "{ipaddr}";
          tooltip-format-wifi = "{essid} {signalStrength}%\n{ipaddr}";
        };

        "custom/audio-primary" = {
          exec = "pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'";
          format = "  {}";
          interval = 1;
          on-click = "pavucontrol";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source =  " {volume}%";
          format-source-muted =  " ";
        };

        "sway/workspaces" = {
          format = "{name}";
          enable-bar-scroll = true;
          disable-scroll = false;
          warp-on-scroll = false;
          disable-scroll-wraparound = true;
        };

        "bluetooth" = {
          format = " ";
          on-click-middle = "blueman-manager && swaymsg \"[app_id=^.blueman-manager-wrapped$]\" focus";
          tooltip = true;
          tooltip-format = "{status}\n{device_alias}";
        };
        # "wlr/workspaces" = {
        #      disable-scroll = true;
        #      sort-by-name = true;
        #      format = " {icon} ";
        #      format-icons = {
        #          default = "";
        #      };
        #  };
        # "pulseaudio" = {
        #   on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        #   format = "  {volume}%";
        # };
        "tray" = {
            icon-size = 16;
            spacing = 8;
        };
        # "custom/music" = {
        #     format = "  {}";
        #     escape = true;
        #     interval = 5;
        #     tooltip = false;
        #     exec = "playerctl metadata --format='{{ title }}'";
        #     on-click = "playerctl play-pause";
        #     max-length = 50
        # };
        "clock#time" = {
            timezone = "Europe/Warsaw";
	    format = "󰥔  {:%H:%M}";
            tooltip-format = "<big>{:%d %B %Y}</big>";
        };
        "clock#date" = {
            timezone = "Europe/Warsaw";
	    format = "  {:%d-%m}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "backlight" = {
            device = "intel_backlight";
            format = "  {percent}%";
        };
        "battery" = {
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            # format-plugged = "";
            # format-alt = "{icon}";
            format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        # "pulseaudio" = {
        #     // "scroll-step" = 1, // %, can be a float
        #     format = "{icon} {volume}%";
        #     format-muted = "";
        #     format-icons = {
        #         default = ["", "", " "]
        #     };
        #     on-click = "pavucontrol"
        # };
        # "custom/lock" = {
        #     tooltip = false;
        #     on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
        #     format = "";
        # };
        # "custom/power" = {
        #     tooltip = false;
        #     on-click = "wlogout &";
        #     format = "襤"
        # };
      };
    };
    style = ''
      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }
      
      window#waybar {
        /* you can also GTK3 CSS functions! */
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #workspaces button {
        color: @text;
      }

      #workspaces button.focused {
        background-color: @mauve;
	color: @base;
      }

      #workspaces button:hover {
        background-color: @lavender;
	color: @base;
      }
    '';
  };
}
