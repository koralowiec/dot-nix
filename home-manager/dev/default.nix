{ pkgs, ... }:
{ 
  imports = [
    ./git.nix
    ./k8s.nix
    ./vscode.nix
  ];

  # Basic dev tools
  home.packages = with pkgs; [
    cmake
    gcc
    gnumake
    insomnia
    python3
  ]; 
  
  # Enable SSH agent for private keys
  services.ssh-agent = {
    enable = true;
  };
}
