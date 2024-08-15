{ config, lib, pkgs, ... }:
{ 
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    extraConfig = ''
      # Fixes the issue with incorrect colors in nvim
      # https://github.com/mhartington/oceanic-next/issues/51#issuecomment-1028541987
      # set -ga terminal-overrides \",*256col*:Tc\"

      # Reassign the Alt+f combination to send the Alt+f keystrokes
      # directly to the bash shell within tmux
      # Fixes the issue after tilish installation
      bind-key -n M-f send-keys M-f

      set -g @urlview-key 'x'
      # https://github.com/alacritty/alacritty/issues/3354#issuecomment-1585708714
      set-option -ga terminal-overrides ",alacritty:Tc"
      # set -g default-terminal "alacritty"
    '';
    historyLimit = 10000;
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'
        '';
      }
      {
        plugin = tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-default 'tiled'
        '';
      }
      tmuxPlugins.tmux-thumbs
    ];
    tmuxp.enable = true;
  };
}
