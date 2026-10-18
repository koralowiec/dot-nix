{ pkgs, ... }:
{
  # CLI tools that should always be available at the system level,
  # regardless of whether home-manager is wired up for a given host.
  environment.systemPackages = with pkgs; [
    age
    chezmoi
    file # needed by yazi
    git
    htop
    mise
    neovim
    nodejs # tracks current Node.js LTS
    playerctl
    python3
    tmux
  ];

  programs.bash.interactiveShellInit = ''
    eval "$(${pkgs.mise}/bin/mise activate bash)"
  '';

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
  ];
}
