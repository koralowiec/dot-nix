{ pkgs, ... }:
let
  customFlameshot = pkgs.flameshot.override {
    enableWlrSupport = true;
    enableMonochromeIcon = true;
  };
in
{ 
  # Any GUI tool that doesn't fit other place
  home.packages = with pkgs; [
    customFlameshot
    anki
    arandr
    asunder
    brasero
    brave
    copyq
    nemo
    xviewer
    evince
    firefox
    freecad
    gImageReader
    gimp
    gnome-clocks
    gnome-sound-recorder
    gnome-pomodoro
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
    simple-scan
    steam
    xdotool
  ]; 

  programs.obs-studio = {
    enable = true;
  };
}
