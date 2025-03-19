{ pkgs, ... }:
{ 
  # Any tool that doesn't fit other place
  # But's needed in sway setup
  home.packages = with pkgs; [
    wdisplays
  ]; 
}
