# Configuration for Dev/DevOps tools (such as languages)

{ config, lib, pkgs, ... }: { 
  home.packages = [
    pkgs.cargo
    pkgs.cmake
    pkgs.cobra-cli
    pkgs.difftastic
    pkgs.gcc
    pkgs.gnumake
    pkgs.gotools
    pkgs.luarocks
    pkgs.nodejs
    pkgs.python3
    pkgs.terraform
  ]; 

  programs.git = {
    enable = true;
    userEmail = "36413794+koralowiec@users.noreply.github.com";
    userName = "koralowiec";
    aliases = {
      st = "status";
    };
  };

  programs.go = {
    enable = true;
    goPath = "go";
  };
}
