# Configuration for CLI tools: bash

{ config, lib, pkgs, ... }:
{ 
  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      n = "nvim";
      "n." = "nvim .";
      py = "python3";
    };
  };
}
