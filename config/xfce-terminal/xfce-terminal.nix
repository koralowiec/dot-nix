# Configuration for xfce4-terminal

{ config, lib, pkgs, ... }: 
let
  themesDestination = ".local/share/xfce4/terminal/colorschemes";
  themesCatppuccinSource = builtins.fetchGit {
    url = "https://github.com/catppuccin/xfce4-terminal.git";
    rev = "f8a43a2d3a4496ae8a04028c704d02ccb592ffcd";
  };
in
{
  xdg.configFile.terminalrc = {
    target = "xfce4/terminal/terminalrc";
    source = ./terminalrc;
  };

  home.packages = [ 
    pkgs.xfce.xfce4-terminal
  ];

  home.file."my-github-repo" = {
    target = themesDestination;
    # source = "https://github.com/catppuccin/xfce4-terminal.git";
    source = "${themesCatppuccinSource}/src";
  };
}
