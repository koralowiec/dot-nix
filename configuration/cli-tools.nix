{ pkgs, pkgs-unstable, ... }:
{
  # CLI tools that should always be available at the system level,
  # regardless of whether home-manager is wired up for a given host.
  environment.systemPackages = with pkgs; [
    age
    chezmoi
    file # needed by yazi
    gcc # nvim: treesitter parsers
    git
    gnumake # nvim: telescope-fzf-native, LuaSnip jsregexp
    htop
    pkgs-unstable.mise # unstable: the dotfiles/bootstrap features are newer than 26.05's mise
    neovim
    nodejs # tracks current Node.js LTS
    playerctl
    python3
    tmux
    unzip # nvim: mason unpacks LSP servers
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.bash.interactiveShellInit = ''
    eval "$(${pkgs-unstable.mise}/bin/mise activate bash)"
  '';

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    libsecret
    openssl
    zlib
  ];
}
