{ pkgs, ... }:
{ 
  imports = [
    ./main.nix

    ./bash.nix
    ./neovim.nix
    ./starship.nix
    ./tmux.nix
  ];
}
