{ config, lib, pkgs, ... }: 
let
  catppuccinAlacrittySource = builtins.fetchGit {
    url = "https://github.com/catppuccin/alacritty.git";
    rev = "3c808cbb4f9c87be43ba5241bc57373c793d2f17";
  };
  catppuccinAlacrittyDestination = ".local/share/alacritty";
in
{
  home.file."alacritty-catppuccin" = {
    target = catppuccinAlacrittyDestination;
    source = catppuccinAlacrittySource;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "~/${catppuccinAlacrittyDestination}/catppuccin-macchiato.yml"
      ];
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
      };
    };
  };
}
