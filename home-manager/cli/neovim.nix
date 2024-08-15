{ pkgs, ... }:
{ 
  home.packages = with pkgs; [
    pkgs.neovim
  ]; 

  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  programs.bash = {
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      n = "nvim";
      "n." = "nvim .";
    };
  };
}
