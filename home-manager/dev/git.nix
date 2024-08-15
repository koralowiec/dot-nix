{ pkgs, ... }:
{ 
  home.packages = with pkgs; [
    tig
  ];

  programs.git = {
    enable = true;
    userEmail = "36413794+koralowiec@users.noreply.github.com";
    userName = "koralowiec";
    aliases = {
      st = "status";
    };
  };
}
