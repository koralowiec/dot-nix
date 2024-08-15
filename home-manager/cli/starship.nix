{ config, lib, pkgs, ... }:
{ 
  programs.starship = {
    enable = true;
    settings = {
      container = {
        # disabled = true;
        symbol = "📦";
        format = "[ $symbol]($style) ";
      };
      hostname = {
        disabled = false;
        format = "[$ssh_symbol](bold blue)@[$hostname](bold red) ";
        ssh_only = false;
      };
      sudo = {
        disabled = false; 
        format = "[$symbol]($style) ";
        symbol = "🔓";
      };
      username = {
        disabled = false;
        style_user = "white bold";
        style_root = "black bold";
        format = "[$user]($style)";
        show_always = true;
      };
    };
  };
}
