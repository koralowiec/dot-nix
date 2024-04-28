# Configuration for GUI application (such as browsers)

{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{ 
  home.packages = [
    pkgs.anki
    unstable.pkgs.anytype
    pkgs.asunder
    pkgs.android-studio
    pkgs.blanket
    pkgs.blender
    pkgs.brave
    pkgs.brasero
    pkgs.copyq
    pkgs.cura
    pkgs.dbeaver
    pkgs.freecad
    pkgs.gImageReader
    pkgs.gimp
    pkgs.heroic
    pkgs.insomnia
    pkgs.kolourpaint
    pkgs.lame # mp3 encoding
    pkgs.logseq
    pkgs.localsend
    pkgs.libreoffice
    pkgs.nextcloud-client
    unstable.pkgs.obsidian
    pkgs.openscad
    pkgs.signal-desktop
    pkgs.steam
    pkgs.thunderbird
    pkgs.via
    pkgs.gnomeExtensions.forge
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      github.copilot
      golang.go
      hashicorp.terraform
      ms-python.python
      redhat.vscode-yaml
      vscodevim.vim
    ];
    # package = pkgs.vscodium;
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "telemetry.telemetryLevel" = "off";
      "github.copilot.inlineSuggest.enable" = true;
    };
  };

  programs.obs-studio = {
    enable = true;
  };
}
