{ pkgs, ... }:
{
  # CLI tools that should always be available at the system level,
  # regardless of whether home-manager is wired up for a given host.
  environment.systemPackages = with pkgs; [
    chezmoi
    git
    mise
    neovim
    playerctl
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
