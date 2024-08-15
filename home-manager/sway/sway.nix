{ pkgs, ... }: 
let 
  defaultTerminal = "alacritty";
  modifier = "Mod4";
  alt = "Mod1";
  left = "h";
  down = "j";
  up = "k";
  right = "l";
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = modifier;
      terminal = defaultTerminal; 
      startup = [];
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
      keybindings = {
        # Exit sway (logs you out of your Wayland session)
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        # Reload the configuration file
        "${modifier}+Shift+r" = "reload";
        # Kill focused window
        "${modifier}+Shift+q" = "kill";

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
        "${modifier}+0" = "workspace number 10";
        "${modifier}+comma" = "workspace number 11";
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
        "${modifier}+Shift+comma" = "move container to workspace number 11";
        "${modifier}+Shift+period" = "move container to workspace number 12";
        "${modifier}+Shift+slash" = "move container to workspace number 13";
        "${modifier}+Shift+semicolon" = "move container to workspace number 14";
        "${modifier}+Shift+apostrophe" = "move container to workspace number 15";

        # Apps
        "${modifier}+Shift+Return" = "exec ${pkgs.firefox}/bin/firefox";
        "${modifier}+x" = "exec ${pkgs.cinnamon.nemo}/bin/nemo";
        "${modifier}+Shift+S" = "exec ${pkgs.flameshot}/bin/flameshot gui";
        "${alt}+Return" = "exec ${pkgs.planify}/bin/io.github.alainm23.planify.quick-add";

        # Media
        "${modifier}+Shift+z" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ 1";
        "${modifier}+Shift+x" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ 0";
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
    };
  };
}
