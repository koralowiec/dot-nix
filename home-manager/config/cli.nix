# Configuration for CLI tools (such as editor)

{ config, lib, pkgs, ... }:
{ 
  imports = [
    ./cli/bash.nix
    ./cli/starship.nix
    ./cli/tmux.nix
  ];

  home.packages = [
    pkgs.abcde
    pkgs.bc
    # pkgs.clipboard-jh
    pkgs.cmus
    pkgs.ddcutil
    pkgs.distrobox
    pkgs.lf
    pkgs.mp3splt
    pkgs.neovim
    pkgs.pulseaudio # for pactl
    pkgs.restic
    pkgs.superfile
    pkgs.tig
    pkgs.tldr
    pkgs.xclip
    pkgs.usbutils
    pkgs.vagrant
  ];

  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  programs.thefuck = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    # tmux.enableShellIntegration = true;
  };

  programs.helix = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

}
