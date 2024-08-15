{ config, lib, pkgs, ... }: 
let
  catppuccinAlacrittySource = builtins.fetchGit {
    url = "https://github.com/catppuccin/alacritty.git";
    rev = "94800165c13998b600a9da9d29c330de9f28618e";
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
        "~/${catppuccinAlacrittyDestination}/catppuccin-macchiato.toml"
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
