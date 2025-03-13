{ pkgs, ... }:
{ 
  # Any CLI/TUI tool that doesn't fit other place
  home.packages = with pkgs; [
    distrobox
    jq
    pulseaudio # for pactl
    superfile
    tldr
    xclip
    usbutils
  ]; 

  programs.thefuck = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };
}
