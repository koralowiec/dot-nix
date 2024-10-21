{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "arek";
  home.homeDirectory = "/home/arek";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {};

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/arek/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  # Import config from files
  imports = [
    # ../config/cli.nix
    # ../config/default-apps.nix
    ../config/de.nix
    # ../config/dev.nix
    # ../config/espanso.nix
    # ../config/gui.nix
    # ../config/k8s.nix
    # ../config/syncthing.nix
    # ../config/virt.nix
    ../cli
    ../dev
    ../gui
    ../sway
  ];

  # Enable catppucin globally for Home Manager
  catppuccin = {
    enable = true;
    flavor = "macchiato";
  };

  # Allow software with unfree licenses
  nixpkgs.config.allowUnfree = true;
}

