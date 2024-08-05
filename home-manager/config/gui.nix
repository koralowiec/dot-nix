# Configuration for GUI application (such as browsers)

{ config, lib, pkgs, ... }:
let
  # unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{ 
  home.packages = [
    pkgs.anki
    # unstable.pkgs.anytype
    pkgs.anytype
    pkgs.asunder
    pkgs.android-studio
    pkgs.blanket
    pkgs.blender
    pkgs.brave
    pkgs.brasero
    pkgs.bruno
    pkgs.copyq
    pkgs.cura
    pkgs.dbeaver-bin
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
    pkgs.obsidian
    # unstable.pkgs.obsidian
    pkgs.openscad
    pkgs.orca-slicer
    # unstable.pkgs.planify
    pkgs.planify
    pkgs.signal-desktop
    pkgs.sqlitebrowser
    pkgs.steam
    pkgs.thunderbird
    pkgs.via
    pkgs.gnomeExtensions.forge
  ];

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    # extensions = with unstable.pkgs.vscode-extensions; [
    #   catppuccin.catppuccin-vsc
    #   github.copilot
    #   github.copilot-chat
    #   golang.go
    #   hashicorp.terraform
    #   ms-python.black-formatter
    #   ms-python.python
    #   redhat.vscode-yaml
    #   vscodevim.vim
    # ];
    keybindings = [
      {
        key = "ctrl+shift+'";
        command =  "workbench.action.chat.openInSidebar";
      }
      {
        key = "ctrl+shift+/";
        command = "workbench.action.togglePanel";
      }
      {
        key = "ctrl+j";
        command = "-workbench.action.togglePanel";
      }
      {
        key = "alt+'";
        command = "workbench.action.focusPanel";
      }
    ];
    # package = unstable.pkgs.vscode;
    package = pkgs.vscode;
    mutableExtensionsDir = true;
    userSettings = {
      "editor.formatOnSave" = true;
      "editor.lineNumbers" = "relative";
      "editor.minimap.enabled" = false;
      "github.copilot.editor.enableAutoCompletions" = true;
      "python.languageServer" = "Pylance";
      "vim.useSystemClipboard" = true;
      "window.menuBarVisibility" = "toggle";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "catppuccin-macchiato";
      # Disable VS Code's keybind for Ctrl+P in terminal
      "terminal.integrated.commandsToSkipShell" = [
        "-workbench.action.quickOpen"
      ];
      "telemetry.telemetryLevel" = "off";
    };
  };

  programs.obs-studio = {
    enable = true;
  };
}
