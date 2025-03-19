{ config, lib, pkgs, ... }:
{ 
  programs.tmux = {
    enable = true;
    baseIndex = 0;
    escapeTime = 0;
    extraConfig = ''
      # Fixes the issue with incorrect colors in nvim
      # https://github.com/mhartington/oceanic-next/issues/51#issuecomment-1028541987
      # set -ga terminal-overrides \",*256col*:Tc\"

      # https://github.com/alacritty/alacritty/issues/3354#issuecomment-1585708714
      set-option -ga terminal-overrides ",alacritty:Tc"
      # set -g default-terminal "alacritty"
    '';
    historyLimit = 10000;
    keyMode = "vi";
    plugins = with pkgs; [];
  };
}
