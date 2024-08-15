{ pkgs, ... }:
{ 
  # Any GUI tool that doesn't fit other place
  home.packages = with pkgs; [
    anki
    arandr
    asunder
    brasero
    brave
    copyq
    cinnamon.nemo
    cinnamon.xviewer
    evince
    firefox
    flameshot
    freecad
    gImageReader
    gimp
    gnome.gnome-clocks
    gnome.gnome-sound-recorder
    gnome.simple-scan
    gnome.pomodoro
    kolourpaint
    lame # mp3 encoding
    libreoffice
    obsidian
    openscad
    orca-slicer
    networkmanagerapplet
    pavucontrol
    planify
    rhythmbox
    signal-desktop
    steam
    xdotool
  ]; 

  programs.obs-studio = {
    enable = true;
  };
}
